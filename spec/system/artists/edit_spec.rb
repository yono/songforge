require 'rails_helper'

RSpec.describe 'Edit artist', type: :system do
  let!(:artist) { create(:artist, name: 'An Artist') }
  before { test_sign_in }

  it 'Open form from artists index' do
    visit artists_path
    all('tr')[1].all('td')[1].first(:link).click

    expect(current_path).to eq edit_artist_path(artist)
  end

  context 'valid artist' do
    it 'update a artist' do
      visit edit_artist_path(artist)
      fill_in '歌手名', with: 'The Artist'
      click_on '更新'

      expect(current_path).to eq artist_path(artist)
      expect(page).to have_content 'The Artist'
    end
  end

  context 'invalid artist' do
    it 'show error messages' do
      visit edit_artist_path(artist)
      fill_in '歌手名', with: ''
      click_on '更新'

      expect(page).to have_content '歌手名 を入力してください'
    end
  end
end
