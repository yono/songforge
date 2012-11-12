class Artist < ActiveRecord::Base
  attr_accessible :name

  has_many :songs

  default_scope order('name')
end
