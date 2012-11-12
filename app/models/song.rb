class Song < ActiveRecord::Base
  attr_accessible :artist_id, :last_sang_at, :name
end
