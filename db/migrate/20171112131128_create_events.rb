class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :photo_url
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
