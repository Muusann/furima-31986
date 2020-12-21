class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer        :purcha_id,         null: false, foreign_key: true
      t.string         :post_code,           null: false
      t.string         :phone_number,        null: false
      t.string         :prefecture_id,       null: false
      t.string         :address_number,      null: false
      t.string         :municipalities,      null: false
      t.string         :building
      t.timestamps     
    end
  end
end
