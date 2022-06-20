RSpec.describe CartsController, type: :controller do

  before(:all) do
    @cart = Cart.create()
  end

  it 'checks that a cart can be created' do
    expect(@cart).to be_valid
  end

  it 'checks that a cart can be read' do
    expect(Cart.count).to eq(1)
  end

  it 'checks that a cart can be destroyed' do
    @cart.destroy
    expect(Cart.count).to eq(0)
  end
end
