require 'rails_helper'

RSpec.describe 'New song', type: :system do
  before { test_sign_in }

  it 'Open form from songs index' do
    visit songs_path
    click_on '曲追加'

    expect(current_path).to eq new_song_path
  end

  context 'valid song' do
    it 'register a song' do
      visit new_song_path
      fill_in '曲名', with: 'The Song'
      click_on '追加'

      song = Song.order(created_at: :desc).take
      expect(current_path).to eq song_path(song)
      expect(page).to have_content 'The Song'
    end

    context 'when input a artist name' do
      it 'register a song with a artist' do
        visit new_song_path
        fill_in '曲名', with: 'The Song'
        fill_in 'song[artist_name]', with: 'The Artist'
        click_on '追加'

        song = Song.order(created_at: :desc).take
        expect(current_path).to eq song_path(song)
        expect(page).to have_content 'The Song'
        expect(page).to have_content 'The Artist'
      end
    end

    context 'when select a artist' do
      before do
        create(:artist, name: 'Registered Artist')
      end

      it 'register a song with a artist' do
        visit new_song_path
        fill_in '曲名', with: 'The Song'
        select 'Registered Artist', from: 'song[artist_id]'
        click_on '追加'

        song = Song.order(created_at: :desc).take
        expect(current_path).to eq song_path(song)
        expect(page).to have_content 'The Song'
        expect(page).to have_content 'Registered Artist'
      end
    end
  end

  context 'invalid song' do
    it 'show error messages' do
      visit new_song_path
      click_on '追加'

      expect(page).to have_content '曲名 を入力してください'
    end
  end
end
