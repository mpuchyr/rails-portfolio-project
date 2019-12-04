class Photoshoot < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validate :new_photoshoot_date_cannot_be_in_the_past

    accepts_nested_attributes_for :location

    def new_photoshoot_date_cannot_be_in_the_past
        if start_time < Date.today
            errors.add(:photoshoot_date, "can't be in the past")
        end
    end
end
