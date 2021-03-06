class CreateConstellations < ActiveRecord::Migration[6.0]
  def change
    create_table :constellations do |t|
      t.string :constellation_name
      t.string :star_name
      t.string :description
      t.float :light_years_away_from_earth
      t.string :image_url
    end
  end
end
