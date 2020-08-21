class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                      null: false
      t.text    :explanation,               null: false
      t.integer :category_id,               null: false
      t.integer :status_id,                 null: false
      t.integer :shipping_charge_id,        null: false
      t.integer :shipping_origin_id,        null: false
      t.integer :days_until_shipping_id,    null: false
      t.integer :price,                     null: false
      t.bigint  :user_id,                   null: false
      t.timestamps
    end
    add_foreign_key :items, :users, column: :"user_id"
  end
end
