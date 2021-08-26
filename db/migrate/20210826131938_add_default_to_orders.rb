class AddDefaultToOrders < ActiveRecord::Migration[6.0]
  def change
    change_column_default :orders, :status, 'initialized'
  end
end
