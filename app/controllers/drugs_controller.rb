class DrugsController < ApplicationController
  def index
    @drugs = Drug.all
    authorize @drugs
  end
end
