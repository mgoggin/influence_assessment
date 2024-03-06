class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :description
      t.string :age_group
      t.string :gender

      t.timestamps
    end
  end
end
