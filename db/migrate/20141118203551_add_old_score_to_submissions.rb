class AddOldScoreToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :old_score, :integer 
  end
end
