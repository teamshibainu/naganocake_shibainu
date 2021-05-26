class AddDeleteAtToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :deleted_at, :datetime
  end
end
