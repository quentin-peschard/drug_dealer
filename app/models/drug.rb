class Drug < ApplicationRecord
  has_one_attached :pic
  has_many :ordered_drugs

  def formated_name
    name.split(' ').map { |a| a.capitalize }.join(' ').split(',').first
  end
end
