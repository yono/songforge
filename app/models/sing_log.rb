class SingLog < ActiveRecord::Base
  belongs_to :song

  default_scope order('created_at DESC')

  def sang_at
    self.created_at.strftime("%Y-%m-%d %H:%M")
  end

  def exist_song?
    !self.song.nil?
  end

  def exist_artist?
    !self.song.nil? and !self.song.artist.nil?
  end
end
