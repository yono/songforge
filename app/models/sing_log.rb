class SingLog < ActiveRecord::Base
  attr_accessible :song_id

  belongs_to :song

  default_scope order('created_at')
end
