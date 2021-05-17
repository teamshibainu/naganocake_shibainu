class CreateReceiveds < ActiveRecord::Migration[5.2]
  def change
    create_table :receiveds do |t|
      t.integer :member_id
      t.string :postal_code
      t.string :street_address
      t.string :name

      t.timestamps
    end
  end
end
