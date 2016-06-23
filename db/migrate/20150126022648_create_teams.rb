class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :captain_id
      t.integer :cocaptain_id
      t.integer :tournament_id
      t.timestamps null: false
    end

    add_column :users, :team_id, :integer
  end
end
