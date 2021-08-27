class DrugsController < ApplicationController
  def index
    retrieve_order
    @drugs = policy_scope(Drug)
    @lastorder = Order.where(user: current_user).last
    @pharmacy = Pharmacy.find(params[:pharmacy_id])

  end

  private

  def retrieve_order
    if current_user.orders.where(status: 'initialized').any?
      @order = Order.where(status: 'initialized')
    else
      @order = Order.create(user: current_user, pharmacy_id: params[:pharmacy_id])
    end
  end
end
