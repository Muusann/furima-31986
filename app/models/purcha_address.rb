class PurchaAddress
  include ActiveModel::Model
  attr_accessor :name, :nickname, :purcha_id, :user_id, :post_code, :phone_number, :prefecture_id, :address_number, :municipalities, :building, :item_id

  with_options presence: true do
    validates :purcha_id
    validates :post_code
    validates :prefecture_id
    validates :phone_number
    validates :address_number
    validates :municipalities
    validates :user_id
    validates :item_id
  end
end

def save
  # 住所の情報を保存
  purchas=Purcha.create(user_id:user_id, item_id:item_id,)
  # 寄付金の情報を保存
  Address.create(name:name, nickname:nickname, purcha:purcha, post_code:post_code, phone_number:phone_number, prefecture_id:prefecture_id, address_number:address_number, municipalities:municipalities)
end

