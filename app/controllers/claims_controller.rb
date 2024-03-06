class ClaimsController < ApplicationController
  def create
    claim = offer.claims.create(player: Current.player)

    if claim.persisted?
      redirect_to root_path, notice: "Offer claimed!"
    else
      redirect_to root_path, alert: "Unable to claim offer at this time. Try again later."
    end
  end

  private

  def offer
    Offer.find(params[:offer_id])
  end
end
