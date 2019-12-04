class Location < ApplicationRecord
    has_many :photoshoots
    has_many :users, through: :photoshoots

    accepts_nested_attributes_for :photoshoots

    validates :name, presence: true
end
