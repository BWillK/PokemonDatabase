class Ability < ApplicationRecord
  validates :ability_id, presence: true, uniqueness: true

  has_many :pokemons
  has_many :pokemons, through: :pokemon_abilities
end
