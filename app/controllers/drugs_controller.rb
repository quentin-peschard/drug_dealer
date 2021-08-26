class DrugsController < ApplicationController
  def index
    retrieve_order
    @drugs = policy_scope(Drug)
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
