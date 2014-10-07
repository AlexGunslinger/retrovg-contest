class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :link
      t.string :image_link

      t.timestamps null: false
    end
  end
end
