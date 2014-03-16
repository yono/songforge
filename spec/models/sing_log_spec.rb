require "spec_helper"

describe SingLog do
  describe '.sang_at' do
    it 'is formated' do
      song1 = Song.new :name => 'Automatic99'
      song1.singing!
      expect(song1.sing_logs.first.sang_at).to eq (song1.created_at.strftime("%Y-%m-%d %H:%M"))
    end
  end

  describe '.exist_song?' do
    context 'when exist song' do
      it 'return true' do
        song1 = Song.new :name => 'Automatic9999'
        song1.singing!
        expect(song1.sing_logs.first.exist_song?).to be true
      end
    end

    context 'when not exist song' do
      it 'return false' do
        song1 = Song.new :name => 'Automatic999'
        song1.singing!
        sing_log = song1.sing_logs.first
        song1.destroy!
        expect(sing_log.exist_song?).to be false
      end
    end
  end

  describe '.exist_artist?' do
    context 'when exist artist' do
      it 'return true' do
        artist = Artist.create! :name => 'Hikaru Utada'
        song1 = Song.new :name => 'Automatic', :artist_id => artist.id
        song1.singing!
        expect(song1.sing_logs.first.exist_artist?).to be true
      end
    end

    context 'when not exist artist' do
      it 'return false' do
        artist = Artist.create! :name => 'Hikaru Utada'
        song1 = Song.new :name => 'Automatic', :artist_id => artist.id
        song1.singing!
        artist.destroy!
        expect(song1.sing_logs.first.exist_artist?).to be false
      end
    end
  end
end
