require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Footwear'
    
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(3),
        image: open_asset('footwear1.jpg'),
        quantity: 10,
        price: 91.99
        )
      end
    end
    
    scenario "User sees product details" do
      
      # ACT
      visit root_path

      first('.product_name').click

      sleep 1

      # DEBUG / VERIFY
      save_screenshot

      expect(page).to have_css '.product-detail', count: 1
    end
end