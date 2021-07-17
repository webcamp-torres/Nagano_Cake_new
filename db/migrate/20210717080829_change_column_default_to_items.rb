class ChangeColumnDefaultToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :price, from: nil, to: "0"
  end
end
