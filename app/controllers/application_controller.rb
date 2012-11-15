class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :auth

  private
  def auth
    if Rails.env == 'production'
      authenticate_or_request_with_http_basic do |user, pass|
        user == ENV['BASIC_AUTH_USERNAME'] and pass == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
