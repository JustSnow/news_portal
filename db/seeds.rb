# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times {|n| Category.create(:name => "Category new #{n}")}

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

30.times do |n|
	p = u.posts.build(
		:moderation => rand(0..2),
		:title => "test title #{n}", 
		:intro => "test intro #{n} 
							Кнопки с функционалом checkbox или radio
							Группы кнопок могут иметь функционал радио-кнопок, 
							когда только одна кнопка может быть активирована, или как флажок, 
							когда ряд кнопок может быть активирован. Ознакомьтесь с Javascript 
							плагином управляющим этим действием.", 
		:full => "test full #{n}
							Кнопки с функционалом checkbox или radio
							Группы кнопок могут иметь функционал радио-кнопок, 
							когда только одна кнопка может быть активирована, 
							или как флажок, когда ряд кнопок может быть активирован. 
							Ознакомьтесь с Javascript плагином управляющим этим действием.", 
		:category_ids => rand(1..5)
	)

	p.save
end