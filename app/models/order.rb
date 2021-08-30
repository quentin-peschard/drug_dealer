class Order < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacy
  has_many :ordered_drugs, dependent: :destroy
  has_many :drugs, through: :ordered_drugs


  def drug_count(drug)
    drugs.where(id: drug.id).count
  end

  STATUS = %()

  def quantity
    ordered_drugs.pluck(:quantity).sum
  end

  def total_price
    ordered_drugs.map do |ordered_drug|
      ordered_drug.price * ordered_drug.quantity
    end.sum
  end
end
