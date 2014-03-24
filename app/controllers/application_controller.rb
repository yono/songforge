class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :html, :json

  before_action :auth

  private

  def auth
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |user, pass|
        user == ENV['BASIC_AUTH_USERNAME'] && pass == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
