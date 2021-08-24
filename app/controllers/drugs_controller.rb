class DrugsController < ApplicationController
  def index
    @drugs = policy_scope(Drug)
    @drugs = Drug.all
    @drugs = policy_scope(Drug)
    order_oui_non = current_user.orders.where(pharmacy_id: params[:pharmacy_id], status: "en cours d'achat").first
    if order_oui_non
      @order = order_oui_non
    else
      @order = Order.create(user: current_user, pharmacy_id: params[:pharmacy_id], status: "en cours d'achat")
    end
  end


end
