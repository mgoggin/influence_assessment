class HomeController < ApplicationController
  def index
    claims = Current.player.claims

    offers = Offer
      .where(gender: Current.player.gender, age_group: Current.player.age_group)
      .where.not(id: claims.pluck(:offer_id))
      .all

    render Home::IndexView.new(offers:)
  end
end
