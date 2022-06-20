RSpec.describe Cart, type: :model do

  before(:all) do
    @cart = Cart.create()
    @product = Product.create(product_code: "001", name: "test", price: 10)
    @cart_item = CartItem.create(product_id: @product.id, cart_id: @cart.id, quantity: 3)
    @spend_based_discount = SpendBasedDiscount.create(min_spending: 60.00, discount: 10.00)
    @quantity_based_discount = QuantityBasedDiscount.create(min_quantity: 2, new_price: 8.50, product_id: 1)
  end

  it 'return total of cart without any discount' do
    expect(@cart.total_without_discount).to eq(30)
  end
end
