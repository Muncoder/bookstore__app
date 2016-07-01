# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create!(first_name: 'John', last_name: 'Doe')
Author.create!(first_name: 'James', last_name: 'Brown')
Author.create!(first_name: 'Kibria', last_name: 'Chy')
Author.create!(first_name: 'Sames', last_name: 'Ann')
Author.create!(first_name: 'Annie', last_name: 'Hon')
Author.create!(first_name: 'Kimpur', last_name: 'Dus')
Author.create!(first_name: 'Robi', last_name: 'Jawan')

Publisher.create!([
	{ name: 'Willy' },
	{ name: 'John' },
	{ name: 'Kimple' },
	{ name: 'Bond' },
	{ name: 'Nindi' }
	])

Book.create!(title: 'Javascript in action', isbn: '978-222-345-111',
			page_count: 350, description: 'A book for front user manual', price: 345.22,
			published_at: '2017-10-10', publisher_id: 4,
			book_cover: File.open(File.join(Rails.root, 'app/assets/images/face.jpg')))