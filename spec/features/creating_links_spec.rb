feature 'Add url links' do 
  scenario 'I can add links to bookmark manager' do
    visit '/links/new'

    fill_in :title, with: 'Google'
    fill_in :url, with: 'http://www.google.com'
    click_button "Submit"

    expect(current_path).to eq '/links'

    expect(page).to have_content "Google"
  end
end