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
    authorize @ordered_drug
    @ordered_drug.update(ordered_drug_params)
    redirect_back(fallback_location: root_path)
  end

  def create
    @ordered_drug = OrderedDrug.new(drug: Drug.find(params[:drug_id]), order: Order.find(params[:order_id]))
    authorize @ordered_drug
    if @ordered_drug.save!
      redirect_to drugs_path(params: { pharmacy_id: params[:pharmacy_id] })
    else
      render :new
    end
  end

  def destroy
    @ordered_drug = OrderedDrug.find(params[:id])

    authorize @ordered_drug
    @ordered_drug.destroy
    redirect_to order_path(@ordered_drug.order, anchor: "ordered_wrap")
  end

  def plus
    @ordered_drug = OrderedDrug.find(params[:id])
    authorize @ordered_drug
    @ordered_drug.quantity += 1
    @ordered_drug.save
    redirect_to order_path(@ordered_drug.order)
  end

  def minus
    @ordered_drug = OrderedDrug.find(params[:id])
    authorize @ordered_drug
    @ordered_drug.quantity -= 1 if @ordered_drug.quantity >= 1
    @ordered_drug.save
    redirect_to order_path(@ordered_drug.order)
  end

  private

  def ordered_drug_params
    params.require(:ordered_drug).permit(:quantity, :price, :prescriptions)
  end
end
