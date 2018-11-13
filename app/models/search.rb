class Search
  def self.search(query)
    pinning = Song.includes(:artist).where.not(pinned_at: nil).reorder('songs.pinned_at DESC').references(:artists)
    unsing = Song.includes(:artist).where(pinned_at: nil).where(last_sang_at: nil).reorder('songs.created_at DESC').references(:artists)
    already = Song.includes(:artist).where(pinned_at: nil).where.not(last_sang_at: nil).reorder('last_sang_at ASC').references(:artists)

    unless query.blank?
      pinning = pinning.where(search_with_word(query))
      unsing = unsing.where(search_with_word(query))
      already = already.where(search_with_word(query))
    end

    pinning.to_a + unsing.to_a + already.to_a
  end

  def self.search_with_word(query)
    q = "%#{query}%"
    [Song, Artist].map {|cond| cond.arel_table[:name].matches(q) }
                  .inject {|cond, i| cond.or i }
  end
end
