class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    if params.has_key? :artist_name
      artist = Artist.new(song_params)
      artist.save
      @song.artist_id = artist.id
    end
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update_attributes(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
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
