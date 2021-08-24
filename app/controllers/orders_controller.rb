class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
  end

  def new
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
    @order = Order.new
    authorize @order
  end

  def edit
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to order_path(@order)
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
    @order.pharmacy = @pharmacy
    @order.user = current_user
    authorize @order
    if @order.save
      redirect_to drugs_path
    else
      render '???'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    authorize @order
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :total, :pharmacy_id, :status, :accepted)
  end
end
