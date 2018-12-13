class SessionsController < ApplicationController
  skip_before_action :redirect_to_mobile

  def new
  end

  def create
    if User.authenticate(params[:session][:username], params[:session][:password])
      sign_in
      redirect_to root_path
    else
      redirect_to signin_path, flash: {error: t('dictionary.form.login_error')}
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
