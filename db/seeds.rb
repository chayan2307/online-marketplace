# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all
SpendBasedDiscount.destroy_all
QuantityBasedDiscount.destroy_all

SpendBasedDiscount.create(min_spending: 60.00, discount: 10.00)

Product.create(product_code: '001', name: 'Lavender Heart', price: 9.25)
Product.create(product_code: '002', name: 'Personalised cufflinks', price: 45.00)
Product.create(product_code: '003', name: 'Kids T-shirt', price: 19.95)

QuantityBasedDiscount.create(min_quantity: 2, new_price: 8.50, product_id: Product.where(product_code: '001').first.id)
