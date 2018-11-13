# coding: utf-8
module SongDecorator
  def star_link
    icon = 'star-o'
    if sang?
      icon = 'star'
    end
    link_to singing_song_path(self), class: "span" do
      fa_icon icon
    end
  end

  def pin_link
    icon = 'pinterest-p'
    link = pinning_song_path(self)
    if pinned?
      icon = 'map-pin'
      link = remove_pin_song_path(self)
    end
    link_to link, class: "span" do
      fa_icon icon
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
