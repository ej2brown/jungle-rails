require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'error message is present' do
      @product = Product.new
      @category = Product.new
      @product.name = 'product'
      expect { expect(@product.name).to be_nil }.to raise_error
    end

    it 'name to be present' do
      @product = Product.new
      @category = Product.new
      @product.name = 'product'
      expect(@product.name).to be_present  
    end

    it 'price to be present' do
      @product = Product.new
      @category = Product.new
      @product.price = '1'
      expect(@product.price).to be_present  
    end

    it 'quantity to be present' do
      @product = Product.new
      @category = Product.new
      @product.quantity = '1'
      expect(@product.quantity).to be_present  
    end

    it 'category to be present' do
      @product = Product.new
      @category = Product.new
      @product.category_id = '1'
      expect(@product.category_id).to be_present  
    end
  end
end
