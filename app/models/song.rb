class Song < ActiveRecord::Base
  attr_accessible :artist_id, :last_sang_at, :name

  belongs_to :artist
  has_many :sing_logs

  default_scope order('last_sang_at DESC')

  def singing!
    self.last_sang_at = DateTime.now
    save!
    sing_log = SingLog.new(:song_id => id)
    sing_log.save!
  end

  module UnionHack
    def union(*relations)
      from '((' + relations.map { |r| r.to_sql }.join(') UNION (') + ')) AS ' + self.table_name
    end
  end
  extend UnionHack
end
