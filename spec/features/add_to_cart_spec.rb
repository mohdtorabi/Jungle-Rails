require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        image: open_asset('apparel1.jpg'),
        price: 64.99
      )
    end
    @user = User.create!(
      name:'yoyo',
      email:'test@test.com',
      password:'1234',
      password_confirmation: '1234',
    )
  end
  scenario "They see all cart products" do
    # ACT
    visit 'login'

    fill_in 'email', with:'test@test.com'
    fill_in 'password', with:'1234'
    find('input[value="Submit"]').click
    sleep 2
    save_screenshot
    # DEBUG
    
    first('article.product').find_button('Add').click
    expect(page).to have_content('My Cart (1)')

    save_screenshot
      
      
    # VERIFY
    # expect(page).to have_css 'article.product', count: 10
    
  end
end
