class AddBackgroundImageToGames < ActiveRecord::Migration
  def change
    add_column :games, :background_link, :string
  end
end
