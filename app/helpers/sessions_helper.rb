module SessionsHelper
  def sign_in
    session[:username] = ENV['BASIC_AUTH_USERNAME']
  end

  def sign_out
    session[:username] = nil
  end

  def authenticate
    deny_access unless signed_in?
  end

  def signed_in?
    session[:username]
  end

  def deny_access
    redirect_to signin_path
  end
end
