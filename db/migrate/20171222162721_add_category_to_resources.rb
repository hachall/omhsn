class AddCategoryToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :category, :string
  end
end
