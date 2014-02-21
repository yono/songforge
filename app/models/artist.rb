class Artist < ActiveRecord::Base
  has_many :songs
  
  validates_presence_of :name
  validates_uniqueness_of :name

  default_scope { order('name') }
end
