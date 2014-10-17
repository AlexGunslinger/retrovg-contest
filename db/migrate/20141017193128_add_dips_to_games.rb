class AddDipsToGames < ActiveRecord::Migration
  def change
    add_column :games, :dips, :text
  end
end
