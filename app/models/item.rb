class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options numericality: { other_than:1 } do
  validates :category_id
  validates :delivery_date_id
  validates :delivery_fee_id
  validates :condition_id
  validates :prefecture_id
  end

  has_one_attached :image
  belongs_to       :user
  has_one          :purcha

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
