class CreateSingLogs < ActiveRecord::Migration[4.2]
  def change
    create_table :sing_logs do |t|
      t.integer :song_id

      t.timestamps
    end
  end
end
