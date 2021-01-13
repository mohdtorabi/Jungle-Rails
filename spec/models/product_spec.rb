require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'displays the product name' do 
      @category = Category.new(name:"MEW")
      @category.save
      @product = Product.new(name:"Steph", price:20, quantity:20, category:@category)
      @product.save
      expect(@product.id).to be_present
    end
    it 'should not save if name is nil' do
      @category = Category.new(name: "great")
      @category.save!
      @product = Product.new(name: nil, price: 1000, quantity: 30, category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should not save if price is nil' do
      @category = Category.new(name: "great")
      @category.save!
      @product = Product.new(name: "boo", price: nil, quantity: 30, category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should not save if quantity is nil' do
      @category = Category.new(name: "great")
      @category.save!
      @product = Product.new(name: "boo", price: 1000, quantity: nil, category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should not save if category is nil' do
      
      @product = Product.new(name: "boo", price: 1000, quantity: 30, category: nil)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  
end
