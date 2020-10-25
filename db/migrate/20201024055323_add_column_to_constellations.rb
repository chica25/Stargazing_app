class AddColumnToConstellations < ActiveRecord::Migration[6.0]
  def change
    add_column :constellations, :profile_image, :string
    add_column :constellations, :bio, :string
  end
end
