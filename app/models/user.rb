class User < ApplicationRecord
  # has_one_attached :card_pic
  # Include default devise modules. Others available are:
  has_many :orders
  has_many :pharmacies
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :prescription
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
