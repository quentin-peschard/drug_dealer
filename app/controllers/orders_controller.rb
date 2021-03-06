class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
    @lastorder = Order.where(user: current_user).last
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
    authorize @order
    @order.update(order_params)
    redirect_to order_path(@order)
  end

  def create
    @order = Order.new
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
    @order.pharmacy = @pharmacy
    @order.user = current_user
    authorize @order

    if @order.save
      redirect_to drugs_path(pharmacy_id: @pharmacy.id)
    else
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    redirect_to orders_path
  end

  def destroy_prescription
    @order = Order.find(params[:id])
    @prescription = @order.prescriptions.find(params[:prescription])
    @prescription.purge
    authorize @order
    redirect_to order_path(@order)
  end

  def show
    @order = Order.find(params[:id])
    @lastorder = Order.where(user: current_user).last
    @ordered_drugs = @order.ordered_drugs.includes(:drug).order('drugs.name asc')
    authorize @order
  end

  def readyStatus
    @order = Order.find(params[:id])
    authorize @order
    @order.status = "ready"

    TwilioClient.new(@order.user, "Hi Mike, get ready for your drug delivery. Your order is ready for payment. - Drug Dealer").send

    if @order.save!
      redirect_to orders_path
    end
  end

  def pendingStatus
    @order = Order.find(params[:id])
    authorize @order
    @order.status = "pending"
    if @order.save!
      redirect_to orders_path
    end
  end

  def completeStatus
    @order = Order.find(params[:id])
    authorize @order
    @order.status = "complete"
    if @order.save!
      redirect_to orders_path
    end
  end

  private

  def order_params
    params.require(:order).permit(abyme_attributes, :user_id, :total, :pharmacy_id, :status, :accepted, prescriptions: [])
  end
end
