class AddNameAndDescriptionToLocations < ActiveRecord::Migration[8.1]
  def change
    add_column :locations, :name, :string
    add_column :locations, :description, :string
  end
end
