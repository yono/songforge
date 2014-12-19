require 'uri'

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :sing_logs

  validates :name, presence: true
  validates :name, uniqueness: { scope: :artist_id }

  before_save :save_artist

  attr_accessor :artist_name

  default_scope { order('last_sang_at DESC') }

  def dummy
    'カバレッジを下げるために生まれた'
  end

  def singing!
    self.last_sang_at = DateTime.now
    save!
    sing_log = SingLog.new(song_id: id)
    sing_log.song_name = name
    sing_log.artist_name = artist.name if artist.present?
    sing_log.save!
  end

  def sang?
    last_sang_at.present?
  end

  def youtube_v
    return nil if movie_url.nil?

    uri = URI.parse(movie_url)

    youtube_v = ''
    uri.query.split('&').each do |query|
      key, value = query.split('=')
      youtube_v = value if key == 'v'
    end
    youtube_v
  end

  def has_movie?
    movie_url.present?
  end

  def lyrics_file=(l)
    if l
      self.lyrics_image = l.read
      self.content_type = l.content_type
    end
  end

  def has_lyrics_file?
    lyrics_image.present?
  end

  def save_artist
    if artist_name.present?
      artist = Artist.new name: artist_name
      artist.save!
      self.artist_id = artist.id
    end
  end
end
