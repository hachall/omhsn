class CreateSavedEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_events do |t|
      t.references :event, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
