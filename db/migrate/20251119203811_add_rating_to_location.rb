class AddRatingToLocation < ActiveRecord::Migration[8.1]
  def change
    add_column :locations, :rating, :decimal, precision: 2, scale: 1, default: 0.0
  end
end
