# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


c = Category.create(:name => 'test category')

3.times {|n| Category.create(:name => "Category new #{n}")}

u = User.create(
	:email => 't@t.ru',
  :password => '123123aA', 
  :password_confirmation => '123123aA'
 )

a = AdminUser.create(
	:email => 'admin@example.com',
	:password => 'password',
	:password_confirmation => 'password'
	)

3.times do |n|
	p = u.posts.build(
		:moderation => 2,
		:title => "test title #{n}", 
		:intro => "test intro #{n}", 
		:full => "test full #{n}", 
		:category_id => c.id
	)

	p.save
end