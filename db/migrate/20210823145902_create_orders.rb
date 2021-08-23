class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :total
      t.string :status
      t.boolean :accepted
      t.references :user, null: false, foreign_key: true
      t.references :pharmacy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
