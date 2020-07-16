module SessionsHelper
  def sign_in(user)
    session[:username] = user
  end

  def sign_out
    reset_session
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
