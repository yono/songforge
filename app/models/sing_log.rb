class SingLog < ActiveRecord::Base
  belongs_to :song

  default_scope { order('created_at DESC') }

  def sang_at
    created_at.strftime('%Y-%m-%d %H:%M')
  end

  def exist_song?
    song.present?
  end

  def exist_artist?
    exist_song? && song.artist.present?
  end
end
