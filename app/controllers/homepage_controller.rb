class HomepageController < ApplicationController
  def index
    @claims = Claim.all.order(:happened_at)
  end
end
