class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字で入力してください' } do
    validates :password
  end
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :family_name_full_width
    validates :first_name_full_width
  end
  with_options presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: '全角カタカナを使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true
end
