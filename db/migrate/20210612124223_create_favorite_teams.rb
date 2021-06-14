class CreateFavoriteTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_teams do |t|
      t.string :name
      t.string :image_id

      t.timestamps
    end
  end
end
