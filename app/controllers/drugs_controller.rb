class DrugsController < ApplicationController
  def index
    retrieve_order

    @users = policy_scope(User).order(created_at: :desc)
    @users = User.where(user: current_user)
    @pharmacies = policy_scope(Pharmacy).order(created_at: :desc)
    @pharmacies = Pharmacy.where(user: current_user)

    @drugs = policy_scope(Drug)
    order_oui_non = current_user.orders.where(pharmacy_id: params[:pharmacy_id], status: "Order in Progress").first

    if order_oui_non
      @order = order_oui_non
    else
      @order = Order.create(user: current_user, pharmacy_id: params[:pharmacy_id], status: "Order in Progress")
    end
  end

  private

  def retrieve_order
    begin
      @order = Order.find(user: current_user, pharmacy: Pharmacy.find(params[:pharmacy_id]))
    rescue
      @order = Order.create(user: current_user, pharmacy: Pharmacy.find(params[:pharmacy_id]))
    end
  end
end
