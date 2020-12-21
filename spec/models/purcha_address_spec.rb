require 'rails_helper'
  RSpec.describe Purcha, type: :model do
    before do
      @user_seller = FactoryBot.create(:user)
      @user_buyer = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      sleep(1)
      @address_purcha = FactoryBot.build(:purcha_address, user_id: @user_buyer.id, item_id: @item.id )
    end
  describe '商品購入機能' do
    context '商品が購入できる時' do
      it 'prefecture_id, address_number, post_code, phone_number, municipalities, token があれば購入できる' do
      expect(@address_purcha.valid?).to eq true
      end
    end

    context '商品が購入できない時' do
      it '都道府県入力がないと購入できない' do
      @address_purcha.prefecture_id = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが1だと購入できない' do
      @address_purcha.prefecture_id = 1
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '住所入力がないと購入できない' do
      @address_purcha.address_number = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Address number can't be blank"
      end
      it '郵便番号入力がないと購入できない' do
      @address_purcha.post_code = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Post code can't be blank"
      end
      it '郵便番号にハイフンが入っていないと購入できない' do
      @address_purcha.post_code = "2222222"
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Post code is invalid"
      end
      it '電話番号入力がないと購入できない' do
      @address_purcha.phone_number = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号が11桁以内でないと購入できない' do
      @address_purcha.phone_number = "222222222222"
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Phone number is invalid"
      end
      it '市町村入力がないと購入できない' do
      @address_purcha.municipalities = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'トークン情報がないと購入できない' do
      @address_purcha.token = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idがないと購入できない' do
      @address_purcha.user_id = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idがないと購入できない' do
      @address_purcha.item_id = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
