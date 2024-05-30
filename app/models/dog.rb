class Dog < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  include PgSearch::Model
  pg_search_scope :search_by_name_and_race,
    against: [ :name, :race ],
    using: {
      tsearch: { prefix: true }
    }
end
