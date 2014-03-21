class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    song_num = 100
    @all_songs = Search.search(params[:q])
    respond_with @songs = Kaminari.paginate_array(@all_songs).page(params[:page]).per(song_num)
  end

  def show
    respond_with @song
  end

  def new
    @song = Song.new
    if params[:artist_id].present?
      artist = Artist.find(params[:artist_id])
      @song.artist = artist if artist.present?
    end
    respond_with @song
  end

  def edit
  end

  def create
    @song = Song.new(song_params)
    @song.save
    respond_with @song
  end

  def update
    respond_to do |format|
      if @song.update_attributes(song_params)
        format.html { redirect_to @song }
      else
        format.html { render action: 'edit' }
      end
    end
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
    send_data(@song.lyrics_image, type: @song.content_type)
  end

  private

    def set_song
      @song = Song.find(params[:id])
    end
    
    def song_params
      params.require(:song).permit(:name, :artist_id, :artist_name, :movie_url, :last_sang_at, :lyrics_file)
    end

end
