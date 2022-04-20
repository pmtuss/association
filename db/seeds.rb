# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ra
users = User.create([
    {name: "user01", email: "email01@aaaa.com"},
    {name: "user02", email: "email02@aaaa.com"}
])

users[0].posts.create([
    {title: "post 01", body: "this is post 01"},
    {title: "post 02", body: "this is post 02"}
])

users[0].create_address(state: "Ha Noi")
users[0].events.create([
    {name: "Gio to 10/3"},
    {name: "Nghi le 30/4 - 1/5"}
])

card = Card.create(user: User.first)
bank_info = BankInfo.create(name: "MB bank", card: card)
