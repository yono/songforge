class SongsController < ApplicationController
  before_action :authenticate
  before_action :set_song, only: [:show, :edit, :update, :destroy, :singing, :pinning, :remove_pin]

  def index
    song_num = 100
    @all_songs = Song.search(params[:q])
    @songs = Kaminari.paginate_array(@all_songs).page(params[:page]).per(song_num)
  end

  def show
  end

  def new
    @song = Song.new
    if params[:artist_id].present?
      artist = Artist.find_by(id: params[:artist_id])
      @song.artist = artist if artist.present?
    end
  end

  def edit
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      flash[:notice] = 'Song was successfully created.'
      redirect_to @song
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      flash.now.notice = "曲情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_url
  end

  def singing
    @song.singing!
    redirect_to songs_url
  end

  def pinning
    @song.pinning!
    redirect_to songs_url
  end

  def remove_pin
    @song.remove_pin!
    redirect_to songs_url
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id, :artist_name, :movie_url, :last_sang_at, :lyrics_file)
  end
end
