class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :family_name , presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} 
  validates :first_name , presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :read_family , presence: true, format: { with:/\A[ァ-ヶー]+\z/}
  validates :read_first , presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :birthday , presence: true
  
 # has_many :items
 # has_many :histories
end
