require "spec_helper"
require 'tempfile'

describe Song do
  describe 'validation' do
    it 'Song has name each artist' do
      artist = Artist.create! :name => 'Hikaru Utada'
      song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
      song2 = Song.new :name => 'Automatic', :artist_id => artist.id
      expect(song2.invalid?).to be true
    end
  end

  describe '.singing!' do
    it 'count up SingLog' do
      artist = Artist.create! :name => 'Hikaru Utada'
      song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
      count = SingLog.count
      expect{
        song1.singing! 
      }.to change(SingLog, :count).by(1)
    end
  end

  describe '.sang?' do
    context 'when not sang' do
      it 'return false' do
        artist = Artist.create! :name => 'Hikaru Utada'
        song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
        expect(song1.sang?).to be false
      end
    end

    context 'when already sang' do
      it 'return true' do
        artist = Artist.create! :name => 'Hikaru Utada'
        song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
        song1.singing!
        expect(song1.sang?).to be true
      end
    end
  end

  describe '.youtube_v' do
    context 'has no movie_url' do
      it 'return nil' do
        song1 = Song.create! :name => 'Automatic'
        expect(song1.youtube_v).to be nil
      end
    end

    context 'has movie_url' do
      it 'return youtube_v parameter' do
        song1 = Song.create! :name => 'Automatic',
                             :movie_url => 'http://www.youtube.com/watch?v=abcdefghi'
        expect(song1.youtube_v).to eq('abcdefghi')
      end
    end
  end

  describe '.has_movie?' do
    context 'when has no movie_uel' do
      it 'return false' do
        song1 = Song.create! :name => 'Automatic'
        expect(song1.has_movie?).to be false
      end
    end

    context 'when has movie_url' do
      it 'return true' do
        song1 = Song.create! :name => 'Automatic',
                             :movie_url => 'http://www.youtube.com/watch?v=aaaaaaaaa'
        expect(song1.has_movie?).to be true
      end
    end
  end

  describe '.lyrics_file=' do
    it 'store content_type' do
      song1 = Song.new :name => 'Automatic'
      tempfile = Tempfile::new("test.jpg", "#{Rails.root}/spec/images")
      tempfile.stub(:content_type).and_return('image/jpeg')

      song1.lyrics_file = tempfile
      expect(song1.content_type).to eq('image/jpeg')
    end
  end

  describe '.has_lyrics_file?' do
    context 'when has no lyrics file' do
      it 'return false' do
        song1 = Song.new :name => 'Automatic'
        expect(song1.has_lyrics_file?).to be false
      end
    end

    context 'when has lyrics file' do
      it 'return true' do
        song1 = Song.new :name => 'Automatic'
        tempfile = Tempfile::new("test.jpg", "#{Rails.root}/spec/images")
        tempfile.stub(:content_type).and_return('image/jpeg')
        tempfile.stub(:read).and_return('binary')

        song1.lyrics_file = tempfile
        expect(song1.has_lyrics_file?).to be true
      end
    end
  end

  describe '.artist_name' do
    it 'has no inplementation' do
      song1 = Song.new :name => 'Automatic'
      expect(song1.artist_name).to be nil
    end
  end

  describe '.artist_name=' do
    context 'when args is present' do
      it 'create artist' do
        song = Song.create! :name => 'whiteout', :artist_name => 'Garnet Crow' 
        expect(Artist.where(name: 'Garnet Crow').present?).to be true
      end
    end
    context 'args is blank' do
      it 'create no artist' do
        artist_count = Artist.count
        expect {
          song = Song.create! :name => 'whiteout', :artist_name => ''
        }.to change(Artist, :count).by(0)
      end
    end
  end
end
