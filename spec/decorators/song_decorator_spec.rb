require 'rails_helper'

describe SongDecorator do
  describe '.star_link' do
    context 'when song is already sang' do
      it 'returns link to star' do
        song = create(:song)
        song.singing!
        decorate song
        expect(song.star_link).to eq("<a class=\"span\" href=\"/songs/#{song.id}/singing\"><i class=\"bi bi-star-fill\"></i></a>")
      end
    end

    context 'when song is not song' do
      it 'returns link to blank star' do
        song = create(:song)
        decorate song
        expect(song.star_link).to eq("<a class=\"span\" href=\"/songs/#{song.id}/singing\"><i class=\"bi bi-star\"></i></a>")
      end
    end
  end

  describe '.song_link' do
    context 'when artist is exist' do
      it 'returns link with song name and artist name' do
        artist = create(:artist)
        song = create(:song, artist_id: artist.id)
        decorate song
        expect(song.song_link).to eq("<a href=\"/songs/#{song.id}\">#{song.name} [#{artist.name}]</a>")
      end
    end

    context 'when artist is not exist' do
      it 'returns link with song name' do
        song = create(:song)
        decorate song
        expect(song.song_link).to eq("<a href=\"/songs/#{song.id}\">#{song.name}</a>")
      end
    end
  end

  describe '.artist_link' do
    context 'when artist is exist' do
      it 'returns link to artist' do
        artist = create(:artist)
        song = build(:song, artist_id: artist.id)
        decorate song
        expect(song.artist_link).to eq("<a href=\"/artists/#{artist.id}\">#{artist.name}</a>")
      end
    end

    context 'when artist is not exist' do
      it 'returns message' do
        song = build(:song)
        decorate song
        expect(song.artist_link).to eq t('songs.show.unsetted_artist')
      end
    end
  end

  describe '.lyric_link' do
    it 'returns link to google search' do
      song = build(:song)
      decorate song
      expect(song.lyric_link).to eq("<a target=\"_blank\" href=\"http://google.co.jp/search?q=#{song.name}　#{t('songs.show.lyric')}\">#{t('songs.show.lyric_link_name', name: song.name)}</a>")
    end
  end
end
