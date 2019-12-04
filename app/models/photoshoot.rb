class Photoshoot < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validate :new_photoshoot_date_cannot_be_in_the_past, :photoshoot_cannot_start_and_end_at_same_time,
        :cannot_have_multiple_photoshoots_at_the_same_time

    accepts_nested_attributes_for :location

    def new_photoshoot_date_cannot_be_in_the_past
        if start_time < Date.today
            errors.add(:photoshoot_date, "can't be in the past")
        end
    end

    def photoshoot_cannot_start_and_end_at_same_time
        if start_time == end_time
            errors.add(:photoshoot_start_time, "can't be the same as end time")
        end
    end

    def cannot_have_multiple_photoshoots_at_the_same_time
        shoot = Photoshoot.find_by(start_time: start_time)
        if shoot
            errors.add(:you_already_have_a_photoshoot, "scheduled at that time")
        end
    end
end
