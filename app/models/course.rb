class Course < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }

  validates :owner, presence: true, length: { maximum: 30 }

  validates :starts, presence: true, numericality: { only_integer: true }

  validates :value, presence: true, numericality: true

  validates :description, presence: true

  validates :image, presence: true, length: { maximum: 200 }
end
