feature 'Adding Tags' do
  scenario 'I can add 1 tag to a link' do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :url, with: 'http://www.google.com'
    fill_in :tags, with: 'drama'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('drama')
  end
end