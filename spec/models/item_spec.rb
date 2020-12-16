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
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'category_idが--だと登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end
      it 'condition_idが空だと登録できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition is not a number"
      end
      it 'discriptionが空だと登録できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'priceが空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'delivery_fee_idが空だと登録できない' do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee is not a number"
      end
      it 'delivery_date_idが空だと登録できない' do
        @item.delivery_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date is not a number"
      end
      it 'prefecture_id が空だと登録できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture is not a number"
      end
      it '価格が300未満の場合は出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '価格が10000000以上の場合は出品できない' do
        @item.price = "10000000" 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it '価格が半角数字でないと出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end

