# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
    mail: 'seed@inspe.com',
    name: 'Seedさん',
    member_type: 1,
    password: 'testtest'
)
user = User.create(
    mail: 'admin@inspe.com',
    name: 'かんりしゃ',
    member_type: 1,
    password: 'testtest',
    admin: true
)
50.times.each do
  space = Space.new
  space.user = user
  space.name = Yoshida::Text.sentence[0, 15]
  space.description = Yoshida::Text.sentence + Yoshida::Text.sentence
  space.address = Gimei.address.kanji
  space.mail_address = %w(aaaa@inspe.com bbbb@inspe.com cccc@inspe.com).sample
  space.member_limit = Random.rand(1..50)
  space.charge = Random.rand(50..2000)
  space.cancellation_charge = Random.rand(100..1000)
  space.space_type = 0
  space.visible = true
  space.authorized = true
  space.save
end
