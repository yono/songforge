class Search

  def self.search(query)
    unsing = Song.includes(:artist).where(:last_sang_at => nil)
    already = Song.includes(:artist).where.not(:last_sang_at => nil)

    unless query.blank?
      unsing = unsing.where(search_with_cond(query))
      already = already.where(search_with_cond(query))
    end

    all_songs = unsing.to_a + already.to_a
  end

  private

    def search_with_word(query)
      q = "%#{query}%"
      search_cond = [Song, Artist].each do |obj|
        obj.arel_table[:name].matches(q)
      end.inject {|cond, i| cond.or i }
    end
end
