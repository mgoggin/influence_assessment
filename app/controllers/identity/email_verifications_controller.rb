class Identity::EmailVerificationsController < ApplicationController
  skip_before_action :authenticate, only: :show

  before_action :set_player, only: :show

  def show
    @player.update! verified: true

    redirect_to root_path, notice: "Thank you for verifying your email address"
  end

  def create
    send_email_verification

    redirect_to root_path, notice: "We sent a verification email to your email address"
  end

  private

  def set_player
    @player = Player.find_by_token_for!(:email_verification, params[:sid])
  rescue
    redirect_to edit_identity_email_path, alert: "That email verification link is invalid"
  end

  def send_email_verification
    PlayerMailer.with(player: Current.player).email_verification.deliver_later
  end
end
