RSpec.describe ProductsController, type: :controller do

  before(:all) do
    @product = Product.create(product_code: "001", name: "test", price: "10")
  end

  it 'checks that a product can be created' do
    expect(@product).to be_valid
  end

  it 'checks that a product can be read' do
    expect(Product.where(product_code: "001").first).to eq(@product)
  end

  it 'checks that a product can be updated' do
    @product.update(:name => "test update")
    expect(Product.where(name: "test update").first.product_code).to eq("001")
  end

  it 'checks that a product can be destroyed' do
    @product.destroy
    expect(Product.count).to eq(0)
  end
end
