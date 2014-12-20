class SingLogsController < ApplicationController
  def index
    @sing_logs = SingLog.includes(song: [:artist]).page(params[:page]).per(20)
  end

  def destroy
    sing_log = SingLog.find(params[:id])
    sing_log.destroy

    respond_to do |format|
      format.html { redirect_to sing_logs_url }
    end
  end
end
