require 'rails_helper'

RSpec.describe 'Artists index', type: :system do
  let!(:artist) { create(:artist) }

  before do
    test_sign_in
    visit artists_path
  end

  it 'shows artists index' do
    expect(page).to have_content '歌手追加'
  end

  it 'links to show page' do
    all('tr')[1].all('td')[0].first(:link).click

    expect(current_path).to eq artist_path(artist)
  end
end
