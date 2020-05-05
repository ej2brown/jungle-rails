require 'rails_helper'

RSpec.describe Product, type: :model do
  # let(:product) {Product.new(:name => 'product',:price => 1, :quantity => 1, :category_id => 1)}
  # let(:category) {Category.new}

  describe 'Validations' do

    it 'pass if name, price, quanity, and category_id is present' do
      @category = Category.create(:name => 'test category')
      @product = @category.products.new(:name => 'product', :price => 1, :quantity => 1)
      expect(@product).to be_valid
    end

    it 'requires name to be present' do
      @category = Category.create(:name => 'test category')
      @product = @category.products.new(:name => 'product', :price => 1, :quantity => 1)
      @product.name = nil
      # expect(@product).not_to be_valid
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'price to be present' do
      @category = Category.new
      @product = Product.new
      @product.price = 1
      expect(@product.price).to be_present  
    end

    it 'quantity to be present' do
      @product = Product.new
      @category = Category.new
      @product.quantity = 1
      expect(@product.quantity).to be_present  
    end

    it 'category to be present' do
      @product = Product.new
      @category = Category.new
      @product.category_id = 1
      expect(@product.category_id).to be_present  
    end
  end
end
