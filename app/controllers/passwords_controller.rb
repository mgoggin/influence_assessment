class PasswordsController < ApplicationController
  before_action :set_player

  def edit
    render Passwords::EditView.new(@player)
  end

  def update
    if @player.update(player_params)
      redirect_to root_path, notice: "Your password has been changed"
    else
      render Passwords::EditView.new(@player), status: :unprocessable_entity
    end
  end

  private

  def set_player
    @player = Current.player
  end

  def player_params
    params.permit(:password, :password_confirmation, :password_challenge).with_defaults(password_challenge: "")
  end
end
