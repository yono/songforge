class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.page(params[:page]).per(20)
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

    respond_to do |format|
      if @artist.save
        flash[:notice] = 'Artist was successfully created.'
        format.html { redirect_to @artist }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @artist.update_attributes(artist_params)
        flash[:notice] = 'Artist was successfully updated.'
        format.html { redirect_to @artist }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url }
    end
  end

  private

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end

end
