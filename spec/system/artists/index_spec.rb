require 'rails_helper'

RSpec.describe 'Artists index', type: :system do
  before do
    create_list(:artist, 2)
    test_sign_in
  end

  it 'shows artists index' do
    visit artists_path
    expect(page).to have_content '歌手追加'
  end
end
