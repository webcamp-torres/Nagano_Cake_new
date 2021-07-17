class RenameUnsbscribeStatusColumToMembers < ActiveRecord::Migration[5.2]
  def change
    rename_column :members, :unsbscribe_status, :unsubscribe_status
  end
end
