class AddContactsToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :contacts, :string, array: true, default: []
  end
end
