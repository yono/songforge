class SingLog < ApplicationRecord
  belongs_to :song, optional: true

  scope :default_order, ->{ order(created_at: :desc) }

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
