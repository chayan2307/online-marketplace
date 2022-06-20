class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  has_many :spend_based_discounts
  has_many :quantity_based_discounts

  def total_without_discount
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity * Product.where(id: cart_item.product.id).first.price
    end
    sum
  end

  def sub_total
    sum = 0
    quantity_based_discounts = QuantityBasedDiscount.all

    cart_items.each do |cart_item|
      is_quantity_based_discount = false
      quantity_based_discounts.each do |discount|
        if ((discount.min_quantity <= cart_item.quantity) && (discount.product_id == cart_item.product.id))
          sum += discount.new_price * cart_item.quantity
          is_quantity_based_discount = true
        end
      end
      unless is_quantity_based_discount
        sum += cart_item.total_price
      end
    end
    spend_based_discount = SpendBasedDiscount.all
    spend_based_discount.each do |discount|
      if discount.min_spending < sum
        sum -= sum * discount.discount / 100
      end
    end
    sum
  end
end
