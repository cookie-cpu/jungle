require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do

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

  scenario "They can visit a specific product page" do
    # ACT
    visit root_path
    # page.find('.product article:first-child')
    click_on('Details', match: :first)

    # DEBUG
    # save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
    # save_screenshot
    
  end


end
