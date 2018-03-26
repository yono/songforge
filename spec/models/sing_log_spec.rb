require 'rails_helper'

describe SingLog do

  describe '.sang_at' do
    it 'returns formatted time' do
      song = build(:song)
      song.singing!
      sing_log = song.sing_logs.first
      expect(sing_log.sang_at).to eq song.created_at.strftime('%Y-%m-%d %H:%M')
    end
  end

  describe '.exist_song?' do
    context 'when exist song' do
      it 'return true' do
        song = build(:song)
        song.singing!
        sing_log = song.sing_logs.first
        expect(sing_log.exist_song?).to be true
      end
    end

    context 'when not exist song' do
      it 'return false' do
        song = build(:song)
        song.singing!
        sing_log = song.sing_logs.first
        song.destroy!
        expect(sing_log.exist_song?).to be false
      end
    end
  end

  describe '.exist_artist?' do
    context 'when exist artist' do
      it 'return true' do
        artist = Artist.create! name: 'Hikaru Utada'
        song = build(:song, artist_id: artist.id)
        song.singing!
        sing_log = song.sing_logs.first
        expect(sing_log.exist_artist?).to be true
      end
    end

    context 'when not exist artist' do
      it 'return false' do
        artist = Artist.create! name: 'Hikaru Utada'
        song = build(:song, artist_id: artist.id)
        song.singing!
        sing_log = song.sing_logs.first
        artist.destroy!
        expect(sing_log.exist_artist?).to be false
      end
    end
  end
end
