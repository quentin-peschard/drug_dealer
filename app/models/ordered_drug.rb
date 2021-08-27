class OrderedDrug < ApplicationRecord
  belongs_to :order
  belongs_to :drug
  has_many_attached :prescriptions
end
