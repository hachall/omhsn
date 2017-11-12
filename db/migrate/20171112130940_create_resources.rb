class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :photo_url
      t.string :website
      t.string :address
      t.string :phone_number
      t.string :email
      t.text :what_they_do
      t.text :about
      t.text :tip

      t.timestamps
    end
  end
end
