class DrugsController < ApplicationController
  def index
    retrieve_order

    @drugs = policy_scope(Drug)
    order_oui_non = current_user.orders.where(pharmacy_id: params[:pharmacy_id], status: "Order in Progress").first

    if params[:query].present? #ajouté pour le PG SEARCH
      @drugs = Drug.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @drugs = policy_scope(Drug)
    end

    if order_oui_non
      @order = order_oui_non
    else
      @order = Order.create(user: current_user, pharmacy_id: params[:pharmacy_id], status: "Order in Progress")
    end
  end

  private

  def retrieve_order
    @pharmacy = params[:pharmacy_id]
    begin
      @order = Order.find(user: current_user, pharmacy: Pharmacy.find(params[:pharmacy_id]))
    rescue
      @order = Order.create(user: current_user, pharmacy: Pharmacy.find(params[:pharmacy_id]))
    end
  end
end
