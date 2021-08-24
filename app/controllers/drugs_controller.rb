class DrugsController < ApplicationController
  def index
    @drugs = Drug.all
    @drugs = policy_scope(Drug)
  end
end
