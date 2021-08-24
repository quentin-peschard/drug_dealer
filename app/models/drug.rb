class Drug < ApplicationRecord
  # has_one_attached :photo
  has_many :ordered_drugs
end
