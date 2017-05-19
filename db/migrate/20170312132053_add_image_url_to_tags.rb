class AddImageUrlToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :image_url, :string
  end
end
