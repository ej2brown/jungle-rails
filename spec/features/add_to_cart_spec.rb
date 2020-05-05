require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "add 1 to cart" do
      # ACT
      visit root_path
      expect(page).to have_css 'article.product', count: 10
      first('.product').click_on('Add') 
        
      # DEBUG
      # save_screenshot
        
      # VERIFY
      expect(page).to have_content('My Cart (1)')
      end
  end
