require 'uri'

class Song < ActiveRecord::Base
  attr_accessible :artist_id, :last_sang_at, :name, :movie_url, :youtube_v, :lyrics_file, :has_movie?

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

  def youtube_v
    return nil if self.movie_url.nil?

    uri = URI.parse(self.movie_url)

    youtube_v = ""
    uri.query.split("&").each do |query|
      key, value = query.split("=")
      youtube_v = value if key == "v" 
    end
    youtube_v
  end

  def has_movie?
    return !self.movie_url.nil?
  end

  def lyrics_file= (l)
    if l
      self.lyrics_image = l.read
      self.content_type = l.content_type
    end
  end

  def has_lyrics_file?
    return !self.lyrics_image.nil?
  end

end
