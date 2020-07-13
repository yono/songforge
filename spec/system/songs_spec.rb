require 'rails_helper'

RSpec.describe 'Songs', type: :system do
  before { test_sign_in }

  it 'shows songs index' do
    visit songs_path
    expect(page).to have_content '曲数'
  end
end
