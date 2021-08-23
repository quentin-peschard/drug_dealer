class CreatePharmacies < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :address
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
