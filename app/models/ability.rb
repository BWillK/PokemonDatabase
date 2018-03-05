class Ability < ApplicationRecord
  validates :ability_id, presence: true, uniqueness: true
end
