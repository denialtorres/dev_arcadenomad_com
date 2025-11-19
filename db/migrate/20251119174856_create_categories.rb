class CreateCategories < ActiveRecord::Migration[8.1]
  def up
    create_table :categories do |t|
      t.string :name, null: false
    end

    execute "INSERT INTO categories (name) VALUES('Laundromat')"
    execute "INSERT INTO categories (name) VALUES('Skating Rink')"
    execute "INSERT INTO categories (name) VALUES('Poll Hall')"
    execute "INSERT INTO categories (name) VALUES('Airport')"
  end

  def down
    drop_table :categories
  end
end
