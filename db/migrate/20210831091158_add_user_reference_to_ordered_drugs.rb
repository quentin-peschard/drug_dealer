class AddUserReferenceToOrderedDrugs < ActiveRecord::Migration[6.0]
  def change
    add_reference :ordered_drugs, :user, null: false, foreign_key: true
  end
end
