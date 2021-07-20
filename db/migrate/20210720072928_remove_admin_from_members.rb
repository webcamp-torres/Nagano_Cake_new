class RemoveAdminFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :admin, :boolean
  end
end
