# == Schema Information
#
# Table name: claims
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  offer_id   :bigint           not null
#  player_id  :bigint           not null
#
# Indexes
#
#  index_claims_on_offer_id   (offer_id)
#  index_claims_on_player_id  (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (offer_id => offers.id)
#  fk_rails_...  (player_id => players.id)
#
class Claim < ApplicationRecord
  belongs_to :player
  belongs_to :offer
end
