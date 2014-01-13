class SingLogsController < ApplicationController
  def index
    respond_with @sing_logs = Kaminari.paginate_array(SingLog.all).page(params[:page]).per(20)
  end
end
