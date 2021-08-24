class OrderedDrugsController < ApplicationController
  def index
    @order = Order.find(params[:order_id])
    @ordered_drugs = policy_scope(OrderedDrug).where(order_id: @order.id)
  end

  def new
    @drug = Drug.find(params[:drug_id])
    @ordered_drug = OrderedDrug.new
    authorize @ordered_drug
  end

  def edit
    @ordered_drug = OrderedDrug.find(params[:id])
    authorize @ordered_drug
  end

  def update
    @ordered_drug = OrderedDrug.find(params[:id])
    @ordered_drug.update(ordered_drugs_params)
    redirect_to orders_path
    authorize @ordered_drug
  end

  def create
    @ordered_drug = OrderedDrug.new(ordered_drug_params)
    @drug = Drug.find(params[:drug_id])
    @ordered_drug.drug = @drug
    authorize @ordered_drug
    if @ordered_drug.save
      redirect_to ordered_drugs_path
    else
      render '???'
    end
  end

  def destroy
    @ordered_drug = OrderedDrug.find(params[:id])
    @ordered_drug.destroy
    authorize @ordered_drug
    redirect_to ordered_drug_path
  end

  private

  def ordered_drug_params
    params.require(:ordered_drug).permit(:drug_id, :quantity, :price, :order_id)
  end
end
