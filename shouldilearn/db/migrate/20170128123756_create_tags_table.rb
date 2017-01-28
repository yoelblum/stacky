class CreateTagsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_tables do |t|
      t.string :name
      t.integer :total_count
      t.timestamps
    end
  end
end
