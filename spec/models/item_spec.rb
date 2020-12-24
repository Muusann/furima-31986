require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it 'image,namem, category_id, condition_id, description, price, delivery_date_id,delivery_fee_id, prefecture_id, user_idが存在すれば登録できる' do
       expect(@item).to be_valid
      end
    end

    context '商品が出品できない時' do
      it '写真がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it 'nameが空だと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it 'condition_idが1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it 'discriptionが空だと登録できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品説明を入力してください"
      end
      it 'priceが空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "値段を入力してください"
      end
      it 'delivery_fee_idが1だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料を選択してください"
      end
      it 'delivery_date_idが1だと登録できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送までの日数を選択してください"
      end
      it 'prefecture_id が1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "都道府県を選択してください"
      end
      it '価格が300未満の場合は出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "値段は300以上の値にしてください"
      end
      it '価格が半角英数混合だと出品できない' do
        @item.price = "3a0"
        @item.valid?
        expect(@item.errors.full_messages).to include "値段は数値で入力してください"
      end
      it '価格が半角英字だと出品出来ない' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "値段は数値で入力してください"
      end
      it '価格が10000000以上の場合は出品できない' do
        @item.price = "10000000" 
        @item.valid?
        expect(@item.errors.full_messages).to include "値段は9999999以下の値にしてください"
      end
      it '価格が半角数字でないと出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "値段は数値で入力してください"
      end
      it '価格が全角だと登録できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "値段は数値で入力してください"
      end
    end
  end
end

