class AddBrandIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :brand_id, :bigint
    add_foreign_key :items, :brands, column: :"brand_id"
  end
end
