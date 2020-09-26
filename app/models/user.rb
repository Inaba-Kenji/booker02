class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザー名のバリデーション
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validates :introduction,length: {maximum: 50}

  # レコード削除時に関連するbooksも削除する(dependent: :destroy)
  has_many :books, dependent: :destroy
  attachment :profile_image
end
