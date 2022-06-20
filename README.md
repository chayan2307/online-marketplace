# Online Marketplace

## Description

This is an onlime marketplace which supports to support add, update, delete product. Add to cart feature and apply promotions on cart while calculating cart total.

### Features supported
  * Add, Update and delete product from online marketplace (Fields necessary are, Product_code, Product_name and Price)

  * Add products to cart

  * Increase/decrease quantity of product in cart

  * Calculates total of cart

  * Applies promotions

  * Empty the cart

  * Update the cart

### DB Seed file
  * To ease the process of testing a Database seed file is also provided

  * It preloads product and promotions


        Product.create(product_code: '001', name: 'Lavender Heart', price: 9.25)

        Product.create(product_code: '002', name: 'Personalised cufflinks', price: 45.00)

        Product.create(product_code: '003', name: 'Kids T-shirt', price: 19.95)

        SpendBasedDiscount.create(min_spending: 60.00, discount: 10.00)

        QuantityBasedDiscount.create(min_quantity: 2, new_price: 8.50, product_id: Product.where(product_code: '001').first.id)

### How to run
* Checkout the project
* To setup DB:
`        rails db:drop db:create db:migrate
`
* Seed DB:
          ` rails db:seed`
* Start the server:
          ` rails s`
* Open `localhost:3000` in browser

NOTE: Promotions are loaded using seed file
Please add new promotions to seed file and run `rails db:seed' to see new promotions applied

* To run tests: `bundle exec rspec`
