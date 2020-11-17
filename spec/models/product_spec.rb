require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "creates a product with a name, price, quantity and category" do
      category = Category.create(name: "food")
      new_product = category.products.create(name: "pizza", price: "20", quantity: "5", description: "a delicious meal!")
      expect(new_product.persisted?).to be(true)
    end
    
    it "returns false if product is missing a name" do
      category = Category.create(name: "food")
      new_product = category.products.create(name: nil, price: "20", quantity: "5", description: "a delicious meal!")
      expect(new_product.persisted?).to be(false)
    end

    it "returns false if product is missing a price" do
      category = Category.create(name: "food")
      new_product = category.products.create(name: "pizza", price: nil, quantity: "5", description: "a delicious meal!")
      expect(new_product.persisted?).to be(false)
    end

    it "returns false if product is missing a quanitity" do
      category = Category.create(name: "food")
      new_product = category.products.create(name: "pizza", price: "20", quantity: nil, description: "a delicious meal!")
      expect(new_product.persisted?).to be(false)
    end
    it "returns false if product is missing a category" do
      category = Category.create(name: nil)
      new_product = category.products.create(name: "pizza", price: nil, quantity: "5", description: "a delicious meal!")
      expect(new_product.persisted?).to be(false)
    end
  end
end
