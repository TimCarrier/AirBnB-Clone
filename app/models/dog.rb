class Dog < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings, dependent: :destroy


  include PgSearch::Model
  pg_search_scope :search_by_name_and_race,
    against: [ :name, :race ],
    using: {
      tsearch: { prefix: true }
    }
end
