# coding: utf-8
module SongDecorator
  def star_link
    if sang?
      link_to '<i class="icon-star"></i>'.html_safe, singing_song_path(self)
    else
      link_to '<i class="icon-star-empty"></i>'.html_safe, singing_song_path(self)
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
      t('.unsetted_artist')
    end
  end
end
