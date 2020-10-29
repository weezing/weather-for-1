class City < ApplicationRecord
  belongs_to :user

  geocoded_by :name
  after_validation :geocode
end
