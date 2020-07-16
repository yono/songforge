require 'rails_helper'

RSpec.describe 'Edit song', type: :system do
  let!(:song) { create(:song, name: 'A Song') }
  before { test_sign_in }

  it 'Open form from songs index' do
    visit songs_path
    all('tr')[1].all('td')[2].first(:link).click

    expect(current_path).to eq edit_song_path(song)
  end

  context 'valid song' do
    it 'update a song' do
      visit edit_song_path(song)
      fill_in '曲名', with: 'The Song'
      click_on '更新'

      expect(current_path).to eq song_path(song)
      expect(page).to have_content 'The Song'
    end

    context 'when input a artist name' do
      it 'register a song with a artist' do
        visit edit_song_path(song)
        fill_in 'song[artist_name]', with: 'The Artist'
        click_on '更新'

        expect(current_path).to eq song_path(song)
        expect(page).to have_content 'The Artist'
      end
    end

    context 'when select a artist' do
      before do
        create(:artist, name: 'Registered Artist')
      end

      it 'register a song with a artist' do
        visit edit_song_path(song)
        select 'Registered Artist', from: 'song[artist_id]'
        click_on '更新'

        expect(current_path).to eq song_path(song)
        expect(page).to have_content 'Registered Artist'
      end
    end
  end

  context 'invalid song' do
    it 'show error messages' do
      visit edit_song_path(song)
      fill_in '曲名', with: ''
      click_on '更新'

      expect(page).to have_content '曲名 を入力してください'
    end
  end
end
