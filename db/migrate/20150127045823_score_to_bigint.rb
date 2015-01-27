class ScoreToBigint < ActiveRecord::Migration
  def change
    change_column :submissions, :score, :integer, :limit => 8
  end
end
