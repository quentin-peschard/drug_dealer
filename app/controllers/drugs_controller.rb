class DrugsController < ApplicationController
  def index
    @drugs = policy_scope(Drug)
    @drugs = Drug.all
  end
end
