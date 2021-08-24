class OrderDrugsController < ApplicationController
  def index
    @order_drugs = Order_Drug.all
  end

  def new
    @drug = Drug.find(params[:drug_id])
    @order_drug = Order_Drug.new
    authorize @order_drug
  end

  def edit
    @order_drug = Order_Drug.find(params[:id])
    authorize @order_drug
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_drugs_params)
    redirect_to order_path(@order)
    authorize @order_drug
  end

  def create
    @order_drug = Order_Drug.new(order_drug_params)
    @drug = Drug.find(params[:drug_id])
    @order_drug.drug = @drug
    authorize @order_drug
    if @order_drug.save
      redirect_to order_drugs_path
    else
      render '???'
    end
  end

  def destroy
    @order_drug = Order_Drug.find(params[:id])
    @order_drug.destroy
    authorize @order_drug
    redirect_to order_drug_path
  end

  private

  def order_drug_params
    params.require(:order_drug).permit(:drug_id, :quantity, :price, :order_id)
  end
end
