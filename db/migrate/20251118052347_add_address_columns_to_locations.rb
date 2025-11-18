class AddAddressColumnsToLocations < ActiveRecord::Migration[8.1]
  def change
    add_column :locations, :street, :string
    add_column :locations, :city, :string
    add_column :locations, :zip, :string
    add_column :locations, :state, :string
    add_column :locations, :latitude, :decimal, precision: 15, scale: 10, default: 0.0
    add_column :locations, :longitude, :decimal, precision: 15, scale: 10, default: 0.0
  end
end
