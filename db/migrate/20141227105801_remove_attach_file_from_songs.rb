class RemoveAttachFileFromSongs < ActiveRecord::Migration[4.2]
  def change
    remove_column :songs, :lyrics_image
    remove_column :songs, :content_type
  end
end
