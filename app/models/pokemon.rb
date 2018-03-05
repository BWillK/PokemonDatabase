class Pokemon < ApplicationRecord
  validates :name, :height, :weight, presence: true
  validates :pokemon_id, presence: true, uniqueness: true
end
