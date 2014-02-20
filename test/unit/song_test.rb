require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "unique name scope artist_id" do
    artist = Artist.create! :name => 'Hikaru Utada'
    song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
    song2 = Song.new :name => 'Automatic', :artist_id => artist.id
    assert song2.invalid?
  end
end
