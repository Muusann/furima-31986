require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーの新規登録' do
    it "nick_nameが空だと登録できない" do
      user = User.new(nick_name: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nick_name: "yohei", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
