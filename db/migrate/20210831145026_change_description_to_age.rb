class ChangeDescriptionToAge < ActiveRecord::Migration[6.0]
  def change
    rename_column :drugs, :description, :age
    change_column :drugs, :age, :integer, using: 'age::integer'
  end
end
