feature 'Adding multiple tags' do

  scenario 'I can add a multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education london'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'london')
  end

end