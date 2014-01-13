# coding: utf-8
module SingLogDecorator
  def song_link
    if exist_song?
      link_to song.name, song
    else
      song_name
    end
  end

  def artist_link
    if exist_artist?
      link_to song.artist.name, song.artist
    else
      artist_name
    end
  end
end
