class ChangeColumnToDrugs < ActiveRecord::Migration[6.0]
  def change
    rename_column :drugs, :prescripted, :prescribed
  end
end
