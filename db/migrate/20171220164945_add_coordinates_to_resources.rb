class AddCoordinatesToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :latitude, :float
    add_column :resources, :longitude, :float
  end
end
