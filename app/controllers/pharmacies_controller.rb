class PharmaciesController < ApplicationController
  def index
    @pharmacies = policy_scope(Pharmacy).order(created_at: :desc)
    if params[:query].present?
      @pharmacies = Pharmacy.near(params[:query], 4)
    else
      @pharmacies = Pharmacy.all
    end
    map
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
    @markers = [{ lat: @pharmacy.latitude,
                  lng: @pharmacy.longitude,
                  info_window: render_to_string(partial: 'info_window', locals: { pharmacy: @pharmacy }) }]
    authorize @pharmacy
  end

  private

  def map
    @markers = @pharmacies.geocoded.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        lng: pharmacy.longitude,
        info_window: render_to_string(partial: 'info_window', locals: { pharmacy: pharmacy })
      }
    end
  end
end
