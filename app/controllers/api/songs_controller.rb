class Api::SongsController < ApplicationController
  before_action :authenticate

  def index
    song_num = 100
    @all_songs = Search.search(params[:q])
    @songs = Kaminari.paginate_array(@all_songs).page(params[:page]).per(song_num)
  end
end
