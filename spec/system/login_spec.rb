require 'rails_helper'

RSpec.describe 'Login', type: :system do
  it 'shows login form' do
    visit root_path
    expect(page).to have_content 'ユーザー名'
    expect(page).to have_content 'パスワード'
  end

  describe 'signin with username and password' do
    before do
      allow(User).to receive(:username).and_return('user')
      allow(User).to receive(:password).and_return('pass')
    end

    context 'when correct username and password' do
      it 'successfully login' do
        visit root_path
        fill_in 'ユーザー名', with: 'user'
        fill_in 'パスワード', with: 'pass'

        click_on 'Sign in'

        expect(current_path).to eq(root_path)
      end
    end
    context 'when incorrect password' do
      it 'failed to login' do
        visit root_path
        fill_in 'ユーザー名', with: 'user'
        fill_in 'パスワード', with: 'fail'

        click_on 'Sign in'

        expect(current_path).to eq(signin_path)
      end
    end
  end
end
