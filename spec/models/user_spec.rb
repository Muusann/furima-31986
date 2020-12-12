require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザーの新規登録' do
    context '新規登録できるとき' do
      it 'nick_name, password, password_confirmation, email, first_name, last_name, first_name_f, last_name_f, birth_が存在すれば登録できる' do
        expect(@user.valid?).to eq true
      end
    end

    context '新規登録できないとき' do
      it 'nick_nameが空だと登録できない' do
        @user.nick_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailは@がないと登録できない" do
        @user.email = "test example"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "emailが重複している場合は保存できない" do
        user1 = FactoryBot.create(:user, email: 'test@co.jp') 
        @user = FactoryBot.build(:user, email: 'test@co.jp')
        @user.valid?
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが半角英数混合でなければ登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordが半角英数混合でなければならない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "パスワードが6文字未満の場合、登録できない" do
        @user.password = "aaa00"
        @user.password_confirmation = "aaa00"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "パスワードは確認を含めて2回入力する" do
        @user.password = "aaa000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "パスワードがパスワード（確認用）と一致しなければ登録できない" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa001"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "パスワードが全角だと登録できない" do
        @user.password = "AAA０００"
        @user.password_confirmation = "AAA０００"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "名字が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "名字（フリガナ）が空では登録できない" do
        @user.last_name_f = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name f can't be blank"
      end
      it "名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "名前（フリガナ）が空では登録できない" do
        @user.first_name_f = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name f can't be blank"
      end
      it "名字が全角でないと登録できない" do
        @user.last_name = "kawakami"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it "名前が全角でないと登録できない" do
        @user.first_name = "youhei"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "名字（フリガナ）がカタカナでないと登録できない" do
        @user.last_name_f = "川上"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name f is invalid"
      end
      it "名前（フリガナ）がカタカナでないとと登録できない" do
        @user.first_name_f = "洋平"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name f is invalid"
      end
      it "誕生日が入力されていなければ登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end