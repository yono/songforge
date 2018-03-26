require 'rails_helper'

describe 'Songs', type: :system do
  before do
    allow(ENV).to receive(:[]).and_call_original
    allow(ENV).to receive(:[]).with('BASIC_AUTH_USERNAME').and_return('user')
    allow(ENV).to receive(:[]).with('BASIC_AUTH_PASSWORD').and_return('password')
  end

  it 'adds a new song' do
    visit root_path

    fill_in 'session_username', with: 'user'
    fill_in 'session_password', with: 'password'
    click_button 'Sign in'

    before_count = Song.count
    click_button '曲追加'
    fill_in 'song_name', with: 'SongName'
    click_button '追加'
    expect(before_count).to eq Song.count

    expect(page).to have_content 'SongName'
  end
end
