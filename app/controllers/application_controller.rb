class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :signed_in?

  private

  def sign_in(user)
    session[:username] = user
  end

  def sign_out
    reset_session
  end

  def authenticate
    redirect_to signin_path unless signed_in?
  end

  def signed_in?
    session[:username]
  end
end
