def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def sign_up_with_args
    visit '/users/new'
    fill_in :email, with: 'alice@example.com'
    fill_in :password, with: '12345678'
    fill_in :password_confirmation, with: '87654321'
    click_button 'Sign up'
  end
