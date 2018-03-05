class Type < ApplicationRecord
  validates :name, :generation, presence: true
  validates :type_id, presence: true, uniqueness: true
end
