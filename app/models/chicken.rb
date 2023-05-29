class Chicken < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings, dependent: :destroy

  validates :age, numericality: { only_integer: true }
  validates :age, :breed, :gender, presence: true
  validates :breed, inclusion: { in: ["Andalusian", "Brahma", "Brakel", "Dutch Bantam", "Hamburgh"],
                                 message: '%<value>s is not a valid breed' }
  validates :noise_level, inclusion: { in: %w[low medium high] }
  validates :gender, inclusion: { in: %w[female male] }
end
