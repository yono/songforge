require 'uri'

class Song < ApplicationRecord
  belongs_to :artist, optional: true
  has_many :sing_logs, dependent: :nullify

  validates :name, presence: true, uniqueness: { scope: :artist_id }

  before_save :save_artist

  attr_accessor :artist_name

  scope :default_order, ->{ order(last_sang_at: :desc) }
  scope :search, ->(query) { Search.execute(query) }

  def singing!
    ActiveRecord::Base.transaction do
      self.last_sang_at = DateTime.now
      self.pinned_at = nil
      save!
      sing_log = SingLog.new(song_id: id)
      sing_log.song_name = name
      sing_log.artist_name = artist.name if artist.present?
      sing_log.save!
    end
  end

  def pinning!
    self.pinned_at = Time.zone.now
    save!
  end

  def remove_pin!
    self.pinned_at = nil
    save!
  end

  def sang?
    last_sang_at.present?
  end

  def pinned?
    !!pinned_at
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

  def save_artist
    if artist_name.present?
      artist = Artist.create!(name: artist_name)
      self.artist_id = artist.id
    end
  end
end
