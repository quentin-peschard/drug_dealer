class PagesController < ApplicationController
  def home
    @lastorder = Order.where(user: current_user).last
  end
end
