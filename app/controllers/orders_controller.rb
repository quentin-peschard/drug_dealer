class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
    @ordered_drugs = policy_scope(OrderedDrug)
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
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    authorize @order
    redirect_to orders_path
  end

  def show
    @order = Order.find(params[:id])
    @ordered_drugs = @order.ordered_drugs
    authorize @order
  end

  def readyStatus
    @order = Order.find(params[:id])
    authorize @order
    @order.status = "Ready"
    if @order.save!
      redirect_to order_path(@order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :total, :pharmacy_id, :status, :accepted, :prescription)
  end
end
