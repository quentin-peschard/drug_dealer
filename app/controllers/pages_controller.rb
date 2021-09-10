class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @lastorder = Order.where(user: current_user).last
  end
end
