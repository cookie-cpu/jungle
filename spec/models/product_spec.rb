require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'should validate with correct values' do
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

  
    
  end
end
