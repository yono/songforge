class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    respond_with @artists = Kaminari.paginate_array(Artist.all).page(params[:page]).per(20)
  end

  def show
    respond_with @artist
  end

  def new
    respond_with @artist = Artist.new
  end

  def edit
  end

  def create
    respond_with @artist = Artist.new(artist_params)
  end

  def update
    respond_to @artist.update_attributes(artist_params)
  end

  def destroy
    respond_with @artist.destroy
  end

  private

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end

end
