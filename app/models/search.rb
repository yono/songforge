class Search
  def self.execute(query)
    new(query).search
  end

  def search
    songs = Song.default_scoped.eager_load(:artist).order('songs.pinned_at DESC NULLS LAST, songs.last_sang_at ASC NULLS FIRST, songs.created_at DESC')

    unless query.blank?
      songs = songs.where(search_with_word(query))
    end

    songs
  end

  private

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def search_with_word(query)
    q = "%#{query}%"
    [Song, Artist].map {|cond| cond.arel_table[:name].matches(q) }
                  .inject {|cond, i| cond.or i }
  end
end
