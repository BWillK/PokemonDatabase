class Pokemon < ApplicationRecord
  validates :name, :height, :weight, presence: true
  validates :pokemon_id, presence: true, uniqueness: true

  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  has many :pokemon_abilities
  has_many :abilities, through: :pokemon_abilities
end
