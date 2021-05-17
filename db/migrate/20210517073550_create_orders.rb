class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :shipping_cost
      t.integer :billing_amount
      t.string :postal_code
      t.string :street_address
      t.string :name
      t.integer :payment_method
      t.integer :status


      t.timestamps
    end
  end
end
