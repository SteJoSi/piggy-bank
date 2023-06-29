# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "🌱 Seeding data..."
puts "Deleting old data..."

User.destroy_all
Expense.destroy_all
Category.destroy_all

# create users - Username, password
u1 = User.create(username: Faker::Internet.username(specifier: 8), password: "November11")
u2 = User.create(username: Faker::Internet.username(specifier: 8), password: "December12")
u3 = User.create(username: Faker::Internet.username(specifier: 8), password: "January01")
# create categories/budget - Food, Transportation, Utilities, Savings, Rent, Coffee, Shopping
c1 = Category.create(name: "Groceries", budget: "$200")
c2 = Category.create(name: "Transportation", budget: "$150")
c3 = Category.create(name: "Utilities", budget: "$150")
c4 = Category.create(name: "Rent", budget: "$900")
c5 = Category.create(name: "Shopping", budget: "$250")
c6 = Category.create(name: "Takeout", budget: "$100")
c7 = Category.create(name: "Micellanous", budget: "$100")
# create expenses - Name, price


puts "✅ Done seeding!"

p "Created #{User.count} users"
p "Created #{Category.count} categories"
p "Created #{Expenses.count} expenses"