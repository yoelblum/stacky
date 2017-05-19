class CreateMonthlyScores < ActiveRecord::Migration[5.0]
  def change
    create_table :monthly_scores do |t|
      t.integer :score
      t.integer :tag_id
      t.integer :month
      t.string :year
    end
  end
end
