class RemoveAdminFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :admin, :boolean
  end
end
