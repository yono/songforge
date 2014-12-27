class RemoveAttachFileFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :lyrics_image
    remove_column :songs, :content_type
  end
end
