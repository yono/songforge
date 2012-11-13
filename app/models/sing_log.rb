class SingLog < ActiveRecord::Base
  attr_accessible :song_id, :sang_at, :song_name, :artist_name

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
