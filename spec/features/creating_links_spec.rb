feature 'browsing' do
  scenario 'save a website link into database' do
    visit('/links/new')
    fill_in :title, with: 'Google'
    fill_in :url, with: 'www.google.com'
    click_button 'Submit'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'www.google.com'
  end
end
