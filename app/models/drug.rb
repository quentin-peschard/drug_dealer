class Drug < ApplicationRecord
  # has_one_attached :photo
  has_many :ordered_drugs

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  def formated_name
    name.split(' ').map { |a| a.capitalize }.join(' ').split(',').first
  end
end
