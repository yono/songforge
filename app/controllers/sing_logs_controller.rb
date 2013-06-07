class SingLogsController < ApplicationController
  before_action :set_sing_log, only: [:show, :edit, :update, :destroy]

  def index
    respond_with @sing_logs = Kaminari.paginate_array(SingLog.all).page(params[:page]).per(20)
  end

  def show
    respond_with @sing_log
  end

  def new
    respond_with @sing_log = SingLog.new
  end

  def create
    @sing_log = SingLog.new(sing_log_params)
    respond_with @sing_log.save, :location => sing_log_url(@sing_log.id)
  end

  def update
    respond_with @sing_log.update_attributes
  end

  def destroy
    respond_with @sing_log.destroy
  end

  private

    def set_sing_log
      @sing_log = SingLog.find(params[:id])
    end
  
    def sing_log_params
      params.require(:sing_log).permit(:song_id, :sang_at, :song_name, :artist_name)
    end
end
