# coding: utf-8
module SongDecorator
  def star_link
    if sang?
      link_to '<i class="icon-star"></i>'.html_safe, singing_song_path(self)
    else
      link_to '<i class="icon-star-empty"></i>'.html_safe, singing_song_path(self)
    end
  end

  def artist_link
    if artist.nil?
      link_to name, self
    else
      link_to "#{name} [#{artist.name}]", self
    end
  end
end
