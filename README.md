# Jungle

A mini e-commerce application built with Rails 4.2.

## Major Features
### Products page displays products for purchase
!["Adding Products to Cart"](https://github.com/ej2brown/jungle-rails/blob/master/docs/01_Product_List.png)

### Displays Product Status badge
!["Sold Out Badge"](https://github.com/ej2brown/jungle-rails/blob/master/docs/07_Badges.png)

### User authentication with Bcrypt <br />
!["Login Display"](https://github.com/ej2brown/jungle-rails/blob/master/docs/02_Login_Display.png)

### User can add products to cart
!["Adding Products to Cart"](https://github.com/ej2brown/jungle-rails/blob/master/docs/03_Add_Items_Cart.png)

### My cart shows the list of items in your cart
!["Adding Products to Cart"](https://github.com/ej2brown/jungle-rails/blob/master/docs/04_Cart.png)

### User can purchase the items in the cart with credit card (using stripe)
!["Payment with Stripe"](https://github.com/ej2brown/jungle-rails/blob/master/docs/05_Payment_with_Stripe.png)

### Validation and error handling with display messages 

### Order details page after successful payment
!["Order detail page upon successful order"](https://github.com/ej2brown/jungle-rails/blob/master/docs/06_Order_Details.png)

## Tech Stack 
Front-end 
- HTML
- CSS
- SASS-Rails
- Bootstrap 3

Back-end
- Ruby
- Ruby on Rails
- ActiveRecord
- Stripe
- Postgresql

Testing
- RSpec
- Capybara

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
