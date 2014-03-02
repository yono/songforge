require "spec_helper"

describe Song do
  describe 'validation' do
    it 'Song has name each artist' do
      artist = Artist.create! :name => 'Hikaru Utada'
      song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
      song2 = Song.new :name => 'Automatic', :artist_id => artist.id
      song2.invalid?.should be_true
    end
  end

  describe '.singing!' do
    it 'count up SingLog' do
      artist = Artist.create! :name => 'Hikaru Utada'
      song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
      count = SingLog.count
      song1.singing! 
      SingLog.count.should == count + 1
    end
  end

  describe '.sang?' do
    context 'when not sang' do
      it 'return false' do
        artist = Artist.create! :name => 'Hikaru Utada'
        song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
        song1.sang?.should be_false
      end
    end

    context 'when already sang' do
      it 'return true' do
        artist = Artist.create! :name => 'Hikaru Utada'
        song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
        song1.singing!
        song1.sang?.should be_true
      end
    end
  end

  describe '.youtube_v' do
    context 'has no movie_url' do
      it 'return nil' do
        song1 = Song.create! :name => 'Automatic'
        song1.youtube_v.should be_nil
      end
    end

    context 'has movie_url' do
      it 'return youtube_v parameter' do
        song1 = Song.create! :name => 'Automatic',
                             :movie_url => 'http://www.youtube.com/watch?v=aaaaaaaaa'
        song1.youtube_v.should == 'aaaaaaaaa'
      end
    end
  end

  describe '.has_movie?' do
    context 'when has no movie_uel' do
      it 'return false' do
        song1 = Song.create! :name => 'Automatic'
        song1.has_movie?.should be_false
      end
    end

    context 'when has movie_url' do
      it 'return true' do
        song1 = Song.create! :name => 'Automatic',
                             :movie_url => 'http://www.youtube.com/watch?v=aaaaaaaaa'
        song1.has_movie?.should be_true
      end
    end
  end

  describe '.lyrics_file=' do
    pending
  end

  describe '.has_lyrics_file?' do
    pending
  end

  describe '.artist_name' do
    it 'has no inplementation' do
      song1 = Song.create! :name => 'Automatic'
      song1.artist_name.should be_nil
    end
  end

  describe '.artist_name=' do
    context 'when args is present' do
      it 'create artist' do
        song = Song.create! :name => 'whiteout', :artist_name => 'Garnet Crow' 
        Artist.where(name: 'Garnet Crow').present?.should be_true
      end
    end
    context 'args is blank' do
      it 'create no artist' do
        artist_count = Artist.count
        song = Song.create! :name => 'whiteout', :artist_name => '' 
        Artist.count.should == artist_count
      end
    end
  end
end
