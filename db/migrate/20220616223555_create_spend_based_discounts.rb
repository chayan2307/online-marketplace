class CreateSpendBasedDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :spend_based_discounts do |t|
      t.integer :min_spending
      t.float :discount

      t.timestamps
    end
  end
end
