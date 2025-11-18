class AddTelephoneToLocations < ActiveRecord::Migration[8.1]
  def change
    add_column :locations, :telephone, :string, limit: 10
  end
end
