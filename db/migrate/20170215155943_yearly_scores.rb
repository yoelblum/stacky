class YearlyScores < ActiveRecord::Migration[5.0]
  def change
    create_table :yearly_scores do |t|
      t.integer :tag_id, foreign_key: true
      t.string :year, null: false
      t.integer :score
      t.timestamps
    end
  end
end
