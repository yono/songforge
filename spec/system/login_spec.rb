require 'rails_helper'

describe 'Login' do
  it 'shows login form' do
    visit root_url
    expect(page).to have_content 'SongForge'
  end
end
