class Identity::PasswordResetsController < ApplicationController
  skip_before_action :authenticate

  before_action :set_player, only: %i[edit update]

  def new
  end

  def edit
  end

  def create
    if (@player = Player.find_by(email: params[:email], verified: true))
      send_password_reset_email

      redirect_to sign_in_path, notice: "Check your email for reset instructions"
    else
      redirect_to new_identity_password_reset_path, alert: "You can't reset your password until you verify your email"
    end
  end

  def update
    if @player.update(player_params)
      redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_player
    @player = Player.find_by_token_for!(:password_reset, params[:sid])
  rescue
    redirect_to new_identity_password_reset_path, alert: "That password reset link is invalid"
  end

  def player_params
    params.permit(:password, :password_confirmation)
  end

  def send_password_reset_email
    PlayerMailer.with(player: @player).password_reset.deliver_later
  end
end
