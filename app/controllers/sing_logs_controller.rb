class SingLogsController < ApplicationController
  before_action :authenticate

  def index
    @sing_logs = SingLog.includes(song: [:artist]).page(params[:page]).per(20)
  end

  def destroy
    sing_log = SingLog.find(params[:id])
    sing_log.destroy

    redirect_to sing_logs_url
  end
end
