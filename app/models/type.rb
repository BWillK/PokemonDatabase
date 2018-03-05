class Type < ApplicationRecord
  validates :name, :generation, presence: true
  validates :type_id, presence: true, uniqueness: true

  has_many :pokemons
  has_many :pokemons, through: :pokemon_types
end
