class MobileController < ApplicationController
  before_action :authenticate
  skip_before_action :redirect_to_mobile

  def index
  end
end
