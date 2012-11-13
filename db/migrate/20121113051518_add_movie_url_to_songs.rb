class AddMovieUrlToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :movie_url, :string
  end
end
