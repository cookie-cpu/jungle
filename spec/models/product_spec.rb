require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'should validate with a proper values' do
      @category = Category.new(name: 'Houseplants')
      @product = Product.new(
        name: 'Flowers',
        category: @category,
        description: 'nice flowers',
        quantity: 5,
        price: 500,
        image: 'https://i.imgur.com/bFDWhkK.jpg'
      )
      @product.save!

      expect(@product).to be_valid
    end


    it 'should be invalid if no name is provided' do
      @category = Category.new(name: 'Houseplants')
      @product = Product.new(
        name: nil,
        category: @category,
        description: 'nice flowers',
        quantity: 5,
        price: 500,
        image: 'https://i.imgur.com/bFDWhkK.jpg'
      )
      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end


    it 'should be invalid if no price is provided' do
      @category = Category.new(name: 'Houseplants')
      @product = Product.new(
        name: 'Flowers',
        category: @category,
        description: 'nice flowers',
        quantity: 5,
        price: nil,
        image: 'https://i.imgur.com/bFDWhkK.jpg'
      )
      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end


    it 'should be invalid if no quanitity is provided' do
      @category = Category.new(name: 'Houseplants')
      @product = Product.new(
        name: 'Flowers',
        category: @category,
        description: 'nice flowers',
        quantity: nil,
        price: 500,
        image: 'https://i.imgur.com/bFDWhkK.jpg'
      )
      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'should be invalid if no category is provided' do
      @category = Category.new(name: 'Houseplants')
      @product = Product.new(
        name: 'Flowers',
        category: nil,
        description: 'nice flowers',
        quantity: 10,
        price: 500,
        image: 'https://i.imgur.com/bFDWhkK.jpg'
      )
      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end

  
    
  end
end
