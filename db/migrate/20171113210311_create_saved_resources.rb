class CreateSavedResources < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_resources do |t|
      t.references :user, foreign_key: true, index: true
      t.references :resource, foreign_key: true, index: true
      t.timestamps
    end
  end
end
