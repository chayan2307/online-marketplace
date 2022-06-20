class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    quantity_based_discounts = QuantityBasedDiscount.all
    quantity_based_discounts.each do |discount|
      if ((discount.min_quantity <= self.quantity) && (discount.product_id == self.product.id))
        return discount.new_price * self.quantity
      end
    end
    self.quantity * self.product.price
  end
end
