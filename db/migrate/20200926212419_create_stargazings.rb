class CreateStargazings < ActiveRecord::Migration[6.0]
  def change
    create_table :stargazings do |t|
      t.integer :astrophotographer_id
      t.integer :constellation_id
      t.string :location
      t.integer :weather
      t.integer :time

      t.timestamps
    end
  end
end
