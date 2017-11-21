class AddNamesToSingLogs < ActiveRecord::Migration[4.2]
  def change
    add_column :sing_logs, :song_name, :string
    add_column :sing_logs, :artist_name, :string
  end
end
