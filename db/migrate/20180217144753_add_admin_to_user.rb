class AddAdminToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :bool
  end
end
