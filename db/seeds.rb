# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Post.destroy_all

User.create([
    {password: "123456789", email: "admin@aaaa.com", admin: true},
    {password: "123456789", email: "user01@aaaa.com"},
    {password: "123456789", email: "user02@aaaa.com"},
    {password: "123456789", email: "user03@aaaa.com"},
    {password: "123456789", email: "user04@aaaa.com"}
])
user = User.find_by(email: "user01@aaaa.com")
posts = user.posts.create([
    {title: "post 01", body: "this is post 01"},
    {title: "post 02", body: "this is post 02"}
])

user.create_profile(name: "CHO TAI", nickname: "chua", telephone: "0333333333", address: "Nghe An", dob: DateTime.new(2000, 2, 1))
user.events.create([
    {name: "Nghi le 30/4 - 1/5"},
    {name: "Tham quan .... "}
])

posts[0].comments.create(body: "commenttttttttttttttttt", user: user)
posts[0].comments.create(body: "aaaaaaaaaaaaaaaaaaaaaaa", user: user)

user.create_card(card_type: 'VISA', number:"1234567891234567", expire: DateTime.new(2030))
user.card.create_bank_info(name: "Vietinbank", abbreviation_name: "ACB")
