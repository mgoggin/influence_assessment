# == Schema Information
#
# Table name: offers
#
#  id          :bigint           not null, primary key
#  age_group   :string
#  description :string
#  gender      :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Offer < ApplicationRecord
  attribute :gender, GenderType.new
  attribute :age_group, AgeGroupType.new

  has_many :claims, dependent: :destroy
  has_many :players, through: :claims
end
