feature "browsing" do
	scenario "check list of links" do
		link = Link.create(title: "Google", url: "www.google.com")
		visit "/list" 
		expect(page).to have_content("www.google.com")
	end
end