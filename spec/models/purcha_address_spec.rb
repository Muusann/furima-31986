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
      expect(@address_purcha.errors.full_messages).to include "都道府県を入力してください"
      end
      it 'prefecture_idが1だと購入できない' do
      @address_purcha.prefecture_id = 1
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "都道府県を入力してください"
      end
      it '住所入力がないと購入できない' do
      @address_purcha.address_number = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "番地を入力してください"
      end
      it '郵便番号入力がないと購入できない' do
      @address_purcha.post_code = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "郵便番号を入力してください"
      end
      it '郵便番号にハイフンが入っていないと購入できない' do
      @address_purcha.post_code = "2222222"
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "郵便番号は不正な値です"
      end
      it '電話番号入力がないと購入できない' do
      @address_purcha.phone_number = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "電話番号を入力してください"
      end
      it '電話番号が11桁以内でないと購入できない' do
      @address_purcha.phone_number = "222222222222"
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "電話番号は不正な値です"
      end
      it '市町村入力がないと購入できない' do
      @address_purcha.municipalities = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "市町村を入力してください"
      end
      it 'トークン情報がないと購入できない' do
      @address_purcha.token = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "クレジットカード情報を入力してください"
      end
      it 'user_idがないと購入できない' do
      @address_purcha.user_id = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Userを入力してください"
      end
      it 'item_idがないと購入できない' do
      @address_purcha.item_id = ""
      @address_purcha.valid?
      expect(@address_purcha.errors.full_messages).to include "Itemを入力してください"
      end
    end
  end
end
