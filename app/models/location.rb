class Location < ApplicationRecord
    has_many :photoshoots
    has_many :users, through: :photoshoots
end
