class AddPhotoToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :photo, :string
  end
end
