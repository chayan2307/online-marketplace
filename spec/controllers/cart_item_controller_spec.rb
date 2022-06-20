RSpec.describe CartItemsController, type: :controller do

  before(:all) do
    @cart = Cart.create
    @product = Product.create(product_code: '001', name: 'test"', price: '10')
    @cart_item = CartItem.create(product_id: @product.id, cart_id: @cart.id, quantity: 3)
  end

  it 'checks that a cart item can be created' do
    expect(@cart_item).to be_valid
  end

  it 'checks that a cart item can be read' do
    expect(CartItem.where(product_id: @product.id).first.quantity).to eq(3)
  end

  it 'checks that a cart item can be updated' do
    @cart_item.update(:quantity => 4)
    expect(CartItem.where(product_id: '001').first.quantity).to eq(4)
  end

  it 'checks that a cart item can be destroyed' do
    @cart_item.destroy
    expect(CartItem.count).to eq(0)
  end
end
