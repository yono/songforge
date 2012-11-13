class AddLyricsImageToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :lyrics_image, :binary
    add_column :songs, :content_type, :string
  end
end
