class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :dog, dependent: :destroy
end
