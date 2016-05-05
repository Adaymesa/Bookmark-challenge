feature 'filtering bookmarks with tags' do
  before do
    visit 'links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'bubbles'
    click_button 'Create link'
    visit 'links/new'
    fill_in 'url',   with: 'http://www.makersacademy2.com/'
    fill_in 'title', with: 'ebay'
    fill_in 'tags',  with: 'bubbles'
    click_button 'Create link'
    visit 'links/new'
    fill_in 'url',   with: 'http://www.makersacademy3.com/'
    fill_in 'title', with: 'google'
    fill_in 'tags',  with: 'search'
    click_button 'Create link'
  end

  scenario 'shows bookmarks sharing a tag' do
    visit '/tags/bubbles'
    expect(page).to have_content 'ebay' && 'Makers Academy'
    expect(page).not_to have_content 'google'
  end
end
