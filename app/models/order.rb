class Order < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacy
  has_many :ordered_drugs
  has_many :drugs, through: :ordered_drugs
  has_many_attached :prescriptions


  def drug_count(drug)
    drugs.where(id: drug.id).count
  end

  STATUS = %()

  def quantity
    ordered_drugs.pluck(:quantity).sum
  end
end
