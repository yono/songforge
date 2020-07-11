class ArtistsController < ApplicationController
  before_action :authenticate
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.default_order.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      flash[:notice] = 'Artist was successfully created.'
      redirect_to @artist
    else
      render action: :new
    end
  end

  def update
    if @artist.update_attributes(artist_params)
      flash[:notice] = 'Artist was successfully updated.'
      redirect_to @artist
    else
      render action: :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_url
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end
end
