class Ability < ApplicationRecord
  validates :ability_id, presence: true, uniqueness: true

  has_many :pokemon_abilities
  has_many :pokemon, through: :pokemon_abilities
end
