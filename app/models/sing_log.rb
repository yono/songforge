class SingLog < ApplicationRecord
  belongs_to :song

  default_scope { order('created_at DESC') }

  def sang_at
    created_at.strftime('%Y-%m-%d %H:%M')
  end

  def exist_song?
    begin
      song.try(:reload).present?
    rescue ActiveRecord::RecordNotFound
      false
    end
  end

  def exist_artist?
    begin
      exist_song? && song.artist.try(:reload).present?
    rescue ActiveRecord::RecordNotFound
      false
    end
  end
end
