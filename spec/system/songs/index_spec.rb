require 'rails_helper'

RSpec.describe 'Songs index', type: :system do
  before { test_sign_in }

  it 'shows songs index' do
    visit songs_path
    expect(page).to have_content '曲数'
  end

  it 'links to show page' do
    song = create(:song)
    visit songs_path

    all('tr')[1].all('td')[1].first(:link).click
    expect(current_path).to eq song_path(song)
  end

  describe 'singing' do
    before do
      create(:song, name: 'Old Song')
      create(:song, name: 'New Song')

      visit songs_path
    end

    it 'changes icon and order' do
      # __| name ____|_|_|_
      #   | New Song | | |
      #   | Old Song | | |
      expect(all('tr')[1].all('td')[1]).to have_content('New Song')
      expect(all('tr')[2].all('td')[1]).to have_content('Old Song')

      all('tr')[1].all('td')[0].first('a').click

      # __| name ____|_|_|_
      #   | Old Song | | |
      # | | New Song | | |
      expect(all('tr')[1].all('td')[1]).to have_content('Old Song')
      expect(all('tr')[2].all('td')[2]).to have_content('New Song')
    end
  end

  describe 'pinning' do
    before do
      create(:song, name: 'Old Song')
      create(:song, name: 'New Song')
      create(:song, name: 'A Song', last_sang_at: Time.zone.yesterday)

      visit songs_path
    end

    it 'moves the song to top' do
      # __| name ____|_|_|_
      #   | New Song | | |
      #   | Old Song | | |
      # | |   A Song | | |
      expect(all('tr')[1].all('td')[1]).to have_content('New Song')
      expect(all('tr')[2].all('td')[1]).to have_content('Old Song')
      expect(all('tr')[3].all('td')[2]).to have_content('A Song')

      all('tr')[3].all('td')[0].first('a').click

      # __| name ____|_|_|_
      # | |   A Song | | |
      #   | New Song | | |
      #   | Old Song | | |
      expect(all('tr')[1].all('td')[2]).to have_content('A Song')
      expect(all('tr')[2].all('td')[1]).to have_content('New Song')
      expect(all('tr')[3].all('td')[1]).to have_content('Old Song')
    end
  end

  describe 'remove_ping' do
    before do
      create(:song, name: 'Old Song')
      create(:song, name: 'New Song')
      create(:song, name: 'A Song', pinned_at: Time.zone.yesterday, last_sang_at: Time.zone.yesterday)

      visit songs_path
    end

    it 'moves the song to bottom' do
      # __| name ____|_|_|_
      # | |   A Song | | |
      #   | New Song | | |
      #   | Old Song | | |
      expect(all('tr')[1].all('td')[2]).to have_content('A Song')
      expect(all('tr')[2].all('td')[1]).to have_content('New Song')
      expect(all('tr')[3].all('td')[1]).to have_content('Old Song')

      all('tr')[1].all('td')[0].first('a').click

      # __| name ____|_|_|_
      #   | New Song | | |
      #   | Old Song | | |
      # | |   A Song | | |
      expect(all('tr')[1].all('td')[1]).to have_content('New Song')
      expect(all('tr')[2].all('td')[1]).to have_content('Old Song')
      expect(all('tr')[3].all('td')[2]).to have_content('A Song')
    end
  end
end
