class RegistrationsController < ApplicationController
  skip_before_action :authenticate

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      session_record = @player.sessions.create!
      cookies.signed.permanent[:session_token] = { value: session_record.id, httponly: true }

      send_email_verification
      redirect_to root_path, notice: "Welcome! You have signed up successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.permit(:email, :password, :password_confirmation)
  end

  def send_email_verification
    PlayerMailer.with(player: @player).email_verification.deliver_later
  end
end
