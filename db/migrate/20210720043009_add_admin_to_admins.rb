class AddAdminToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :admin, :boolean, default: false
  end
end
