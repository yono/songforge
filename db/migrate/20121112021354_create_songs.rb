class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.datetime :last_sang_at

      t.timestamps
    end
  end
end
