class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.date :last_visit

      t.timestamps null: false
    end
  end
end
