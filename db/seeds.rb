# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  [
	  {
      admin_name: '管理者テスト男性',
      email: 'testman@test.com',
      password: 'aaa111',
    },
    {
      admin_name: '管理者テスト女性',
      email: 'testwoman@test.com',
      password: 'bbb222',
    }
  ]
)
