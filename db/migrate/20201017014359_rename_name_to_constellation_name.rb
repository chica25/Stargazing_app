class RenameNameToConstellationName < ActiveRecord::Migration[6.0]
  def change
    rename_column :constellations, :name, :constellation_name
  end
end
