class OrderedDrug < ApplicationRecord
  belongs_to :order
  belongs_to :drug
end
