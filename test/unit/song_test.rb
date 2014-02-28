require 'test_helper'

class SongTest < ActiveSupport::TestCase
  test "unique name scope artist_id" do
    artist = Artist.create! :name => 'Hikaru Utada'
    song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
    song2 = Song.new :name => 'Automatic', :artist_id => artist.id
    assert song2.invalid?
  end

  test "singing!" do
    artist = Artist.create! :name => 'Hikaru Utada'
    song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
    count = SingLog.count
    song1.singing! 
    assert_equal SingLog.count, (count + 1)
  end
end
