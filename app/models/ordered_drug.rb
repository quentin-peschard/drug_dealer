class OrderedDrug < ApplicationRecord
  belongs_to :order
  belongs_to :drug
  belongs_to :user
  has_many_attached :prescriptions
end
