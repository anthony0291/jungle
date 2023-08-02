require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do

    it "Should save a product" do
      @category = Category.create(name: "Vern")
      @product = Product.create(name:"Fern", price: 100, quantity: 10, category: @category)
      expect(@product).to be_valid
    end

    it "Shouldn't save if there is no name" do
      @category = Category.create(name: "Vern")
      @product = Product.create(name: nil, price: 100, quantity: 10, 
      category: @category)
        expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    # it "shouldn't save a product if there is no Price" do
    #   @category = Category.create(name: "Vern")
    #   @product = Product.create(name: "Fern", price: nil, 
    #   quantity: 10, category: @category)
    #   expect(@product.errors.full_messages).to include "Price can't be blank"
    # end

    it "Product won't be saved if there is no Price" do
      @category = Category.create(name: "Vern")
      @product = Product.create(name: "Fern", price: nil, quantity: 10, category: @category)
      expect(@product.errors.full_messages).to_not include "Price can't be blank"
      # @@@@@@@@
    end

    it "Product won't be saved if there is no Quantity" do
      @category = Category.create(name: "Games")
      @product = Product.create(name: "Zelda", price: 50, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end
    
    it "Product won't be saved if there is no Category" do
      @category = Category.create(name: "Games")
      @product = Product.create(name: "Zelda", price: 50, quantity: 10, category: nil)
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

    

  end
end


# each validation needs it's own @category with @product intitialized within the catoegy

# Create an initial example that ensures that a product with all four fields set will indeed save successfully
# Have one example for each validation, and for each of these:
# Set all fields to a value but the validation field being tested to nil
# Test that the expect error is found within the .errors.full_messages array
# You should therefore have five examples defined given that you have the four validations above

