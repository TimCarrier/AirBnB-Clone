class Dog < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
