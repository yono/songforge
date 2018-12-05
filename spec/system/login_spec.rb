require 'rails_helper'

RSpec.describe 'Login', type: :system do
  it 'shows login form' do
    visit root_path
    expect(page).to have_content 'ユーザー名'
    expect(page).to have_content 'パスワード'
  end
end
