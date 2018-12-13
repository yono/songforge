class ApplicationController < ActionController::Base
  before_action :set_request_variant
  protect_from_forgery
  include SessionsHelper

  private

  def set_request_variant
    request.variant = :smartphone if request.from_smartphone?
  end
end
