class AddTaglinesToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :taglines, :string, array: true, default: []
  end
end
