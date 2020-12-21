class PurchaAddress
  include ActiveModel::Model
    attr_accessor :name, :nickname, :user_id, :post_code, :phone_number, :prefecture_id, :address_number, :municipalities, :building, :item_id, :token

    with_options presence: true do
      validates :prefecture_id, numericality: { other_than:1 }
      validates :address_number
      validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
      validates :phone_number, format: { with: /\A\d{10,11}\z/ }
      validates :municipalities
      validates :user_id
      validates :item_id
      validates :token
  end


  def save
    # 住所の情報を保存
    purcha=Purcha.create(user_id:user_id, item_id:item_id,)
    # 寄付金の情報を保存
    Address.create( purcha_id:purcha.id , post_code:post_code, phone_number:phone_number, prefecture_id:prefecture_id, address_number:address_number, municipalities:municipalities)
  end

end

