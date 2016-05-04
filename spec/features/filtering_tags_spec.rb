# feature 'Filtering Tags' do
#   scenario 'I can filter links by tag' do
#     visit '/tags/bubbles'
#     # fill_in :title, with: 'Google'
#     # fill_in :url, with: 'http://www.google.com'
#     # fill_in :tags, with: 'drama'
#     # click_button 'Submit'
#     link = Link.first
#     expect(link.tags.map(&:name)).to include('bubbles')
#   end
# end