 feature 'Filtering tags' do
   before(:each) do
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
      Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
      Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
      Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
    end
  scenario 'I can filter links by tag' do

    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end

feature 'Viewing links' do
  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content "Makers Academy"
    end
  end
end

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

