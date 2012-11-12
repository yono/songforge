class Song < ActiveRecord::Base
  attr_accessible :artist_id, :last_sang_at, :name

  belongs_to :artist
  has_many :sing_logs

  validates_presence_of :name

  default_scope order('last_sang_at DESC')

  def singing!
    self.last_sang_at = DateTime.now
    save!
    sing_log = SingLog.new(:song_id => id)
    sing_log.save!
  end

  def sang?
    !self.last_sang_at.nil?
  end
end
