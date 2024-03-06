class Identity::EmailsController < ApplicationController
  before_action :set_player

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to_root
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_player
    @player = Current.player
  end

  def player_params
    params.permit(:email, :password_challenge).with_defaults(password_challenge: "")
  end

  def redirect_to_root
    if @player.email_previously_changed?
      resend_email_verification

      redirect_to root_path, notice: "Your email has been changed"
    else
      redirect_to root_path
    end
  end

  def resend_email_verification
    PlayerMailer.with(player: @player).email_verification.deliver_later
  end
end
