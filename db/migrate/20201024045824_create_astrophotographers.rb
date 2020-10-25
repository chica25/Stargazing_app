class CreateAstrophotographers < ActiveRecord::Migration[6.0]
  def change
    create_table :astrophotographers do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
