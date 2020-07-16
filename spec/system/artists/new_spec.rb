require 'rails_helper'

RSpec.describe 'New artist', type: :system do
  before { test_sign_in }

  it 'Open form from songs index' do
    visit artists_path
    click_on '歌手追加'

    expect(current_path).to eq new_artist_path
  end

  context 'valid artist' do
    it 'register a artist' do
      visit new_artist_path
      fill_in '歌手名', with: 'The Artist'
      click_on '追加'

      artist = Artist.order(created_at: :desc).take
      expect(current_path).to eq artist_path(artist)
      expect(page).to have_content 'The Artist'
    end
  end

  context 'invalid artist' do
    it 'show error messages' do
      visit new_artist_path
      click_on '追加'

      expect(page).to have_content '歌手名 を入力してください'
    end
  end
end
