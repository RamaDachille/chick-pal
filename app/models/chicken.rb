class Chicken < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :age, numericality: { only_integer: true }
  validates :age, :breed, :gender, :photo, :name, :address, :price, :description, presence: true
  validates :breed, inclusion: { in: ["Andalusian", "Brahma", "Brakel", "Dutch Bantam", "Hamburgh"],
                                  message: '%<value>s is not a valid breed' }
  validates :noise_level, inclusion: { in: ["", "low", "medium", "high"] }
  validates :gender, inclusion: { in: %w[female male] }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  attr_accessor :query
end
