feature 'checks for password mismatch' do
  scenario 'verifies that password is correct on sign-up' do
    expect { bad_sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users') 
  	expect(page).to have_content 'Password and confirmation password do not match'
  end
end
