class PlayerMailer < ApplicationMailer
  def password_reset
    @player = params[:player]
    @signed_id = @player.generate_token_for(:password_reset)

    mail to: @player.email, subject: "Reset your password"
  end

  def email_verification
    @player = params[:player]
    @signed_id = @player.generate_token_for(:email_verification)

    mail to: @player.email, subject: "Verify your email"
  end
end
