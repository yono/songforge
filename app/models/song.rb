class Song < ActiveRecord::Base
  attr_accessible :artist_id, :last_sang_at, :name

  belongs_to :artist
  has_many :sing_logs

  default_scope order('last_sang_at')
end
