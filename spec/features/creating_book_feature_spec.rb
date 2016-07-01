require 'rails_helper'

RSpec.feature "creating Books" do
	let!(:peachpit) { Fabricate(:publisher, name: 'Peachpit Press') }
	let!(:author1) { Fabricate(:author) }
	let!(:author2) { Fabricate(:author) }

	scenario "with valid inputs succeeds" do
		visit root_path

		click_link "Books", exact: true
		click_link "Add New Book"

		fill_in "book[title]", with: "Javascript"
		fill_in "book[isbn]", with: "98077123456"
		fill_in "book[page_count]", with: 518
		fill_in "book[price]", with: 22.45
		fill_in "book[description]", with: "Learn Javascript the quick and easy way"
		fill_in "book[published_at]", with: "2015-01-10"

		# select "Peachpit Press", :from => 'publisher'
		#select "Peachpit Press", from: "Publisher"

		check author1.full_name
		check author2.full_name

		click_button "Create Book"

		expect(page).to have_content('Book has been created')
	end
end