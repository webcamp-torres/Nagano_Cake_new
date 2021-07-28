class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_fee, null: false, default: 0
      t.integer :total_payment, null: false, default: 0
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status,null: false, default: 0
      t.timestamps
    end
  end
end
