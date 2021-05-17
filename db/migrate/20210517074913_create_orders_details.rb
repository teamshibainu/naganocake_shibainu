class CreateOrdersDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.integer :production_status
      t.integer :price

      t.timestamps
    end
  end
end
