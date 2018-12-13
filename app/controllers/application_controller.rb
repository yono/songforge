class ApplicationController < ActionController::Base
  before_action :set_request_variant
  before_action :redirect_to_mobile

  protect_from_forgery
  include SessionsHelper

  private

  def set_request_variant
    request.variant = :smartphone if request.from_smartphone?
  end

  def redirect_to_mobile
    redirect_to mobile_url if request.variant.smartphone?
  end
end
