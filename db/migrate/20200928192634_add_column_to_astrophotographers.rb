class AddColumnToAstrophotographers < ActiveRecord::Migration[6.0]
  def change
    add_column :astrophotographers, :profile_image, :string
    add_column :astrophotographers, :bio, :string
  end
end
