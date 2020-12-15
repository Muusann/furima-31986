class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :category_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 

  has_one_attached :image
  belongs_to       :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  with_options presence: true, numericality:{ greater_than_or_equal_to:300, less_than_or_equal_to:9999999 } do
    validates :price
  end
end
