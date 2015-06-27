# coding: utf-8
module SongDecorator
  def star_link
    if sang?
      link_to '<i class="fa fa-star"></i>'.html_safe, singing_song_path(self)
    else
      link_to '<i class="fa fa-star-o"></i>'.html_safe, singing_song_path(self)
    end
  end

  def song_link
    if artist.present?
      link_to "#{name} [#{artist.name}]", self
    else
      link_to name, self
    end
  end

  def artist_link
    if artist.present?
      link_to artist.name, artist
    else
      t('songs.show.unsetted_artist')
    end
  end

  def lyric_link
    link_to t('songs.show.lyric_link_name', name: name),
      "#{lyric_url}　#{t('songs.show.lyric')}", target: '_blank'
  end

  def lyric_url
    "http://google.co.jp/search?q=#{name}"
  end
end
