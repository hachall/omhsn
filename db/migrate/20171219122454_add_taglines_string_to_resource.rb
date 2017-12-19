class AddTaglinesStringToResource < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :taglines_as_string, :string
  end
end
