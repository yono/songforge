class SessionsController < ApplicationController

  def new
  end

  def create
    if User.authenticate(params[:session][:username], params[:session][:password])
      sign_in
      redirect_to root_path
    else
      flash.now[:error] = "Invalid username/password combination."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
