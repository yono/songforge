class Artist < ActiveRecord::Base
  has_many :songs

  default_scope order('name')
end
