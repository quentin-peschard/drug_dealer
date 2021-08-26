class Drug < ApplicationRecord
  # has_one_attached :photo
  has_many :ordered_drugs

  def formated_name
    name.split(' ').map { |a| a.capitalize }.join(' ').split(',').first
  end
end
