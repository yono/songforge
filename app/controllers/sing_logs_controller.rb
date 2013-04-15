class SingLogsController < ApplicationController
  # GET /sing_logs
  # GET /sing_logs.json
  def index
    @sing_logs = Kaminari.paginate_array(SingLog.all).page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sing_logs }
    end
  end

  # GET /sing_logs/1
  # GET /sing_logs/1.json
  def show
    @sing_log = SingLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sing_log }
    end
  end

  # GET /sing_logs/new
  # GET /sing_logs/new.json
  def new
    @sing_log = SingLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sing_log }
    end
  end

  # GET /sing_logs/1/edit
  def edit
    @sing_log = SingLog.find(params[:id])
  end

  # POST /sing_logs
  # POST /sing_logs.json
  def create
    @sing_log = SingLog.new(sing_log_params)

    respond_to do |format|
      if @sing_log.save
        format.html { redirect_to @sing_log, notice: 'Sing log was successfully created.' }
        format.json { render json: @sing_log, status: :created, location: @sing_log }
      else
        format.html { render action: "new" }
        format.json { render json: @sing_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sing_logs/1
  # PUT /sing_logs/1.json
  def update
    @sing_log = SingLog.find(params[:id])

    respond_to do |format|
      if @sing_log.update_attributes(sing_log_params)
        format.html { redirect_to @sing_log, notice: 'Sing log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sing_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sing_logs/1
  # DELETE /sing_logs/1.json
  def destroy
    @sing_log = SingLog.find(params[:id])
    @sing_log.destroy

    respond_to do |format|
      format.html { redirect_to sing_logs_url }
      format.json { head :no_content }
    end
  end

  private
  
    def sing_log_params
      params.require(:sing_log).permit(:song_id, :sang_at, :song_name, :artist_name)
    end
end
