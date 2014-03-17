require 'spec_helper'

describe SingLogDecorator do
  describe '.song_link' do
  	context 'when song is exist' do
  	  it 'returns link to song' do
  	    song = create(:song)
  	    song.singing!
  	    sing_log = song.sing_logs.first
  	    decorate sing_log
  	    expect(sing_log.song_link).to eq("<a href=\"/songs/#{song.id}\">#{song.name}</a>")
  	  end
  	end

  	context 'when song is not exist' do
  	  it 'returns song name' do
  	  	song = create(:song)
  	  	song.singing!
  	  	sing_log = song.sing_logs.first
  	  	song.destroy!
  	  	decorate sing_log
  	  	expect(sing_log.song_link).to eq ("#{sing_log.song_name}")
  	  end
  	end
  end

  describe '.artist_link' do
  	context 'when artist is exist' do
  	  it 'returns link to artist' do
  	    artist = create(:artist)
  	    song = create(:song, artist_id: artist.id)
  	    song.singing!
  	    sing_log = song.sing_logs.first
  	    decorate sing_log
  	    expect(sing_log.artist_link).to eq("<a href=\"/artists/#{artist.id}\">#{artist.name}</a>")
  	  end
  	end

  	context 'when artist is not exist' do
  	  it 'returns artist name' do
  	  	artist = create(:artist)
  	    song = create(:song, artist_id: artist.id)
  	    song.singing!
  	    sing_log = song.sing_logs.first
  	    artist.destroy!
  	    decorate sing_log
  	    expect(sing_log.artist_link).to eq("#{sing_log.artist_name}")
  	  end
  	end
  end
end