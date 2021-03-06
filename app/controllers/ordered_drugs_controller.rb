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
    @ordered_drug = OrderedDrug.new(drug: Drug.find(params[:drug_id]), order: Order.find(params[:order_id]), user: current_user)
    @pharmacy = Pharmacy.find(Order.find(params[:order_id]).pharmacy.id)
    authorize @ordered_drug
    @drugs = Drug.all
    if @ordered_drug.save!
      respond_to do |format|
        format.html { redirect_to drugs_path(params: { pharmacy_id: params[:pharmacy_id] }) }
        format.json { render json: {
                                    html: render_to_string(partial: 'drugs/drugs_list.html', locals: { drugs: Drug.all }),
                                    ordered_drugs_count: OrderedDrug.joins(:order).where(orders: { user: current_user, status: 'initialized', pharmacy: @pharmacy }).count
                                    }
                    }
      end

    else
      render :new
    end
  end

  def destroy
    @ordered_drug = OrderedDrug.find(params[:id])

    authorize @ordered_drug
    @ordered_drug.destroy
    redirect_to order_path(@ordered_drug.order, anchor: 'ordered_wrap')
  end

  def plus
    @ordered_drug = OrderedDrug.find(params[:id])
    authorize @ordered_drug
    @ordered_drug.quantity += 1
    @ordered_drug.save
    respond_to do |format|
      format.html { redirect_to order_path(@ordered_drug.order) }
      format.json { render json: { quantity: @ordered_drug.quantity } }
    end
  end

  def minus
    @ordered_drug = OrderedDrug.find(params[:id])
    authorize @ordered_drug
    @ordered_drug.quantity -= 1 if @ordered_drug.quantity >= 1
    @ordered_drug.save
    respond_to do |format|
      format.html { redirect_to order_path(@ordered_drug.order)}
      format.json { render json: {quantity: @ordered_drug.quantity } }
    end
  end

  private

  def ordered_drug_params
    params.require(:ordered_drug).permit(:quantity, :price, :prescriptions)
  end
end
