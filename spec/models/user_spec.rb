require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザーの新規登録' do
    it 'nick_nameが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.nick_name = ""
      user.valid?
      expect(user.errors.full_messages).to include "Nick name can't be blank"
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが半角英数混合でなければ登録できない" do
      user = FactoryBot.build(:user)
      user.password = "000000"
      user.password_confirmation = "000000"
      user.valid?
      expect(user.errors.full_messages).to include "Password is invalid"
    end
    it "パスワードが6文字以下の場合、登録できない" do
      user = FactoryBot.build(:user)
      user.password = "aaa00"
      user.password_confirmation = "aaa00"
      user.valid?
      expect(user.errors.full_messages).to include "Password is invalid"
    end
    it "パスワードは確認を含めて2回入力する" do
      user = FactoryBot.build(:user)
      user.password = "aaa000"
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "パスワードがパスワード（確認用）と一致しなければ登録できない" do
      user = FactoryBot.build(:user)
      user.password = "aaa000"
      user.password_confirmation = "aaa001"
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end