class ChangeTimeToBeAStringInStargazings < ActiveRecord::Migration[6.0]
  def change
    change_column :stargazings, :time, :string
  end
end
