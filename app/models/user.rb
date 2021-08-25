class User < ApplicationRecord
  # has_one_attached :card_pic
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :prescription
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
