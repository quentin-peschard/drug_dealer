class Order < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacy
  has_many :ordered_drugs
  has_many :drugs, through: :ordered_drugs
end
