class AddContactsStringToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :contacts_as_string, :string
  end
end
