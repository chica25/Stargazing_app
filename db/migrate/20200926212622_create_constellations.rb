class CreateConstellations < ActiveRecord::Migration[6.0]
  def change
    create_table :constellations do |t|
      t.string :name
      t.string :description
      t.decimal :light_years_away_from_earth
      t.string :image_url

      t.timestamps
    end
  end
end
