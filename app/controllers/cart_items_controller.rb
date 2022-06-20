class CartItemsController < ApplicationController

  def index
    @cart_items = CartItems.all
  end

  def show
    @cart_item = CartItem.find(params[:id])
  end

  def create
    # Find associated product and current cart
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart

    # If cart already has this product then find the relevant cart_item and iterate quantity otherwise create a new cart_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the cart_item with the chosen_product
      @cart_item = current_cart.cart_items.find_by(:product_id => chosen_product)
      # Iterate the cart_item's quantity by one
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
      @cart_item.cart = current_cart
      @cart_item.product = chosen_product
      @cart_item.quantity = 1
    end

    # Save and redirect to cart show path
    @cart_item.save
    redirect_to cart_path(current_cart)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    else
      @cart_item.destroy
    end
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id, :cart_id)
  end
end
