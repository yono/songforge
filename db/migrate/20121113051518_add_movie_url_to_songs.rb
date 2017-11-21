class AddMovieUrlToSongs < ActiveRecord::Migration[4.2]
  def change
    add_column :songs, :movie_url, :string
  end
end
