class AddNamesToSingLogs < ActiveRecord::Migration
  def change
    add_column :sing_logs, :song_name, :string
    add_column :sing_logs, :artist_name, :string
  end
end
