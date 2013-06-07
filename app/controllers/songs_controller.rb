class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    all_songs = Search.search(params[:q])
    respond_with @songs = Kaminari.paginate_array(all_songs).page(params[:page]).per(20)
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
    respond_with @song.save, :location => song_url(@song.id)
  end

  def update
    respond_with @song.update_attributes(song_params), :location => song_url(@song.id)
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
      params.require(:song).permit(:name, :artist_id, :artist_name, :movie_url, :last_sang_at)
    end

end
