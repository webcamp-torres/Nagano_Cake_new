class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, null: false
      t.integer :member_id, null: false
      t.integer :amount, null: false, default: 1

      t.timestamps
    end
  end
end
