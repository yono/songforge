class SingLog < ActiveRecord::Base
  attr_accessible :song_id, :sang_at

  belongs_to :song

  default_scope order('created_at DESC')

  def sang_at
    self.created_at.strftime("%Y-%m-%d %H:%M")
  end
end
