def test_sign_in
  allow(User).to receive(:username).and_return('user')
  allow(User).to receive(:password).and_return('pass')

  visit root_path

  fill_in 'ユーザー名', with: 'user'
  fill_in 'パスワード', with: 'pass'

  click_on 'Sign in'
end
