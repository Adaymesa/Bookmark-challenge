feature 'checks for password mismatch' do
  scenario 'verifies that password is correct on sign-up' do
    expect { bad_sign_up }.not_to change(User, :count)
    # expect(page).to have_content('Passwords do not match, please try again.')
  end
end
