# coding: utf-8
require 'test_helper'

class SongDecoratorTest < ActiveSupport::TestCase
  def setup
    @song = Song.new.extend SongDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
