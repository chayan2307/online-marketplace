class CreateQuantityBasedDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :quantity_based_discounts do |t|
      t.integer :min_quantity
      t.float :new_price
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
