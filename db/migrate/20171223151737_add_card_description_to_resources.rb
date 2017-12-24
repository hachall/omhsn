class AddCardDescriptionToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :card_description, :string
  end
end
