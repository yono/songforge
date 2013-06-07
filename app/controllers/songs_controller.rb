class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    unsing = Song.includes(:artist).where(:last_sang_at => nil)
    already = Song.includes(:artist).where('last_sang_at IS NOT NULL')

    unless params[:q].blank?
      query = "%" + params[:q] + "%"
      song_cond = Song.arel_table[:name].matches(query)
      artist_cond = Artist.arel_table[:name].matches(query)
      search_cond = song_cond.or artist_cond
      unsing = unsing.where(search_cond)
      already = already.where(search_cond)
    end

    all_songs = unsing.to_a + already.to_a
    @songs = Kaminari.paginate_array(all_songs).page(params[:page]).per(20)

    respond_with @songs
  end

  def show
    respond_with @song
  end

  def new
    respond_with @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.new(song_params)
    if params.has_key? :artist_name
      artist = Artist.new(song_params)
      artist.save
      @song.artist_id = artist.id
    end
    respond_with @song.save
  end

  def update
    respond_with @song.update_attributes(song_params)
  end

  def destroy
    respond_with @song.destroy
  end

  def singing
    @song = Song.find(params[:id])
    @song.singing!

    respond_to do |format|
      format.html { redirect_to songs_url }
    end
  end

  def lyrics_image
    @song = Song.find(params[:id])
    send_data(@song.lyrics_image, :type => @song.content_type)
  end

  private

    def set_song
      @song = Song.find(params[:id])
    end
    
    def song_params
      params.require(:song).permit(:name, :artist_id, :artist_name, :movie_url)
    end

end
