class RenameColumnFromDrugs < ActiveRecord::Migration[6.0]
  def change
    rename_column :drugs, :prescribed, :prescripted
  end
end
