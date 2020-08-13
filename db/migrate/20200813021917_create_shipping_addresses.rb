class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,         null: false
      t.integer :shipping_origin_id, null: false
      t.string :city,                null: false
      t.string :street_number,       null: false
      t.string :room_number
      t.string :phone_number,        null: false
      t.references :item,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
