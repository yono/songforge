class AddPinnedAtToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :pinned_at, :datetime
  end
end
