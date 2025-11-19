class AddReleaseDateToGames < ActiveRecord::Migration[8.1]
  def change
    add_column :games, :release_date, :integer
  end
end
