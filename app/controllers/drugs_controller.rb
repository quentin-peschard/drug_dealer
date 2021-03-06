class DrugsController < ApplicationController
  def index
    retrieve_order
    @drugs = policy_scope(Drug)
    @lastorder = Order.where(user: current_user).last
    @ordered_drugs = policy_scope(OrderedDrug)
    @pharmacy = @lastorder.pharmacy

    if params.dig(:query).present?
      @drugs = @drugs.search_by_name(params[:query])
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'drugs_list.html' }
    end
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
