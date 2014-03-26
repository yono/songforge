class SingLogsController < ApplicationController
  def index
    respond_with @sing_logs = SingLog.includes(song: [:artist]).page(params[:page]).per(20)
  end
end
