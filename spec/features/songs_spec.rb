require 'spec_helper'

feature 'Song management' do
  scenario 'adds a new song', js: true do
    visit root_path
    expect {
      click_button '曲追加'
      fill_in 'song_name', with: 'NewSong'
      click_button '追加'
    }.to change(Song, :count).by(1)
  end
end
