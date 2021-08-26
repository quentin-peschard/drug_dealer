class ChangeDefaultToOrderedDrugs < ActiveRecord::Migration[6.0]
  def change
    change_column_default :ordered_drugs, :quantity, 1
  end
end
