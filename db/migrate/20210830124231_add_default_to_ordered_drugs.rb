class AddDefaultToOrderedDrugs < ActiveRecord::Migration[6.0]
  def change
    change_column_default :ordered_drugs, :price, 0
  end
end
