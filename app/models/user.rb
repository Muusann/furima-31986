class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchaces

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, } do
  validates :first_name
  validates :last_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/ } do
  validates :first_name_f, presence: true
  validates :last_name_f, presence: true
  end

  validates :nick_name, presence: true
  
  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i } do
  validates :password
  end

  validates :birth_day, presence: true
end


