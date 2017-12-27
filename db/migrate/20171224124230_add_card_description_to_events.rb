class AddCardDescriptionToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :card_description, :string
  end
end
