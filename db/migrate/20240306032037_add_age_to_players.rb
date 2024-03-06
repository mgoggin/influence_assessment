class AddAgeToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :age, :integer
  end
end
