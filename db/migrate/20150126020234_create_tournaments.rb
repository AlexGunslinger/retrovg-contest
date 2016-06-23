class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.timestamps null: false
    end

    add_column :games, :tournament_id, :integer
    add_column :users, :tournament_id, :integer
  end
end


