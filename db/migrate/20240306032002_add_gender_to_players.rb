class AddGenderToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :gender, :string
  end
end
