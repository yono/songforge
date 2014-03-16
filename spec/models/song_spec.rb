require "spec_helper"
require 'tempfile'

describe Song do
  describe 'validation' do
    it 'Song has name each artist' do
      artist = Artist.create! :name => 'Hikaru Utada1'
      song = create(:song, name: 'Automatic', artist_id: artist.id)
      duplicate_song = build(:song, name: 'Automatic', artist_id: artist.id)
      expect(duplicate_song.invalid?).to be true
    end
  end

  describe '.singing!' do
    it 'count up SingLog' do
      song = build(:song)
      expect{
        song.singing! 
      }.to change(SingLog, :count).by(1)
    end
  end

  describe '.sang?' do
    context 'when not sang' do
      it 'return false' do
        song = build(:song)
        expect(song.sang?).to be false
      end
    end

    context 'when already sang' do
      it 'return true' do
        song = build(:song)
        song.singing!
        expect(song.sang?).to be true
      end
    end
  end

  describe '.youtube_v' do
    context 'has no movie_url' do
      it 'return nil' do
        song = build(:song)
        expect(song.youtube_v).to be nil
      end
    end

    context 'has movie_url' do
      it 'return youtube_v parameter' do
        song = build(:song, movie_url: 'http://www.youtube.com/watch?v=abcdefghi')
        expect(song.youtube_v).to eq('abcdefghi')
      end
    end
  end

  describe '.has_movie?' do
    context 'when has no movie_uel' do
      it 'return false' do
        song = build(:song)
        expect(song.has_movie?).to be false
      end
    end

    context 'when has movie_url' do
      it 'return true' do
        song = build(:song, movie_url: 'http://www.youtube.com/watch?v=abcdefghi')
        expect(song.has_movie?).to be true
      end
    end
  end

  describe '.lyrics_file=' do
    it 'store content_type' do
      song = build(:song)
      tempfile = Tempfile::new("test.jpg", "#{Rails.root}/spec/images")
      tempfile.stub(:content_type).and_return('image/jpeg')

      song.lyrics_file = tempfile
      expect(song.content_type).to eq('image/jpeg')
    end
  end

  describe '.has_lyrics_file?' do
    context 'when has no lyrics file' do
      it 'return false' do
        song = build(:song)
        expect(song.has_lyrics_file?).to be false
      end
    end

    context 'when has lyrics file' do
      it 'return true' do
        song = build(:song)
        tempfile = Tempfile::new("test.jpg", "#{Rails.root}/spec/images")
        tempfile.stub(:content_type).and_return('image/jpeg')
        tempfile.stub(:read).and_return('binary')

        song.lyrics_file = tempfile
        expect(song.has_lyrics_file?).to be true
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
        song = build(:song, artist_name: 'Garnet Crow')
        expect(Artist.where(name: 'Garnet Crow').present?).to be false

        # After save, persisted the artist.
        song.save!
        expect(Artist.where(name: 'Garnet Crow').present?).to be true
      end
    end

    context 'args is blank' do
      it 'create no artist' do
        artist_count = Artist.count
        expect {
          song = build(:song)
        }.to change(Artist, :count).by(0)
      end
    end
  end
end
