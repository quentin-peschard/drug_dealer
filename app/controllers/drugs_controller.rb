class DrugsController < ApplicationController
  def index
    @drugs = policy_scope(Drug)
    @drugs = Drug.all
    @drugs = policy_scope(Drug)
  end
end
