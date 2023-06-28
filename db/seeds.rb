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
# create categories/budget - Food, Transportation, Utilities, Savings, Rent, Coffee, Shopping
# create expenses - Name, price


puts "✅ Done seeding!"

p "Created #{User.count} users"
p "Created #{Category.count} categories"
p "Created #{Expenses.count} expenses"