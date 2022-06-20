RSpec.describe CartItem, type: :model do

  before(:all) do
    @quantity_based_discount = QuantityBasedDiscount.create(min_quantity: 2, new_price: 8.50, product_id: 1)
    @cart = Cart.create()
    @product = Product.create(product_code: "001", name: "test", price: 10)
    @cart_item = CartItem.create(product_id: @product.id, cart_id: @cart.id, quantity: 3)  end

  it 'return total of cart' do
    expect(@cart_item.total_price).to eq(30)
  end
end
