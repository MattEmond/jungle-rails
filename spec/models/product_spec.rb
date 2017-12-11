require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'should have a valid test' do
      @category = Category.new(id: 1, name: 'Electronics')
      @product = Product.new(name: 'iPhone', quantity: 10, price: 99.99, category: @category)
      expect(@product).to be_valid
    end

    it 'should be invalid without a name' do
      @category = Category.new(id: 1, name: 'Electronics')
      @product = Product.new(name: nil, quantity: 10, price: 99.99, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should be invalid without a quantity' do
      @category = Category.new(id: 1, name: 'Electronics')
      @product = Product.new(name: 'iPhone', quantity: nil, price: 99.99, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should be invalid without a price' do
      @category = Category.new(id: 1, name: 'Electronics')
      @product = Product.new(name: 'iPhone', quantity: 10, price: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should be invalid without a category' do
      @category = Category.new(id: 1, name: 'Electronics')
      @product = Product.new(name: 'iPhone', quantity: 10, price: 99.99, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
