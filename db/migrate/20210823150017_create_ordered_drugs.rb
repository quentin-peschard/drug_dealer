class CreateOrderedDrugs < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_drugs do |t|
      t.references :order, null: false, foreign_key: true
      t.references :drug, null: false, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
