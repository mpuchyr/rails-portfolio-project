class Photoshoot < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validates :start_time, presence: true
    validates :end_time, presence: true

    validate :new_photoshoot_date_cannot_be_in_the_past, :photoshoot_cannot_start_and_end_at_same_time,
        :cannot_have_multiple_photoshoots_at_the_same_time

    accepts_nested_attributes_for :location

    def new_photoshoot_date_cannot_be_in_the_past
        if start_time && start_time < Date.today
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
        if shoot && shoot.id != id
            errors.add(:you_already_have_a_photoshoot, "scheduled at that time")
        end
    end

    def self.location_date_filter(user_photoshoots, params)
        photoshoots = user_photoshoots
        photoshoots = location_filter(photoshoots, params)
        photoshoots = date_filter(photoshoots, params)
        photoshoots

    end


    def self.location_filter(photoshoots, params)
        if !params[:location].blank?
            photoshoots = photoshoots.where(location_id: params[:location])
        end
        photoshoots
    end

    def self.date_filter(photoshoots, params)
        if params[:date]
            if !params[:date][:year].blank? && !params[:date][:month].blank? && !params[:date][:day].blank?
                year = params[:date][:year]
                month = params[:date][:month]
                day = params[:date][:day]
                if month.to_i < 10
                    month = "0" + month.to_s
                end
                if day.to_i < 10
                    day = "0" + day.to_s
                end
                date = "%" + year.to_s + "-" + month.to_s + "-" + day.to_s + "%"
                photoshoots = photoshoots.where('start_time LIKE ?', date)
            elsif !params[:date][:year].blank? && !params[:date][:month].blank? && params[:date][:day].blank?
                year = params[:date][:year]
                month = params[:date][:month]
                if month.to_i < 10
                    month = "0" + month.to_s
                end
                date = "%" + year.to_s + "-" + month.to_s + "-%"
                photoshoots = photoshoots.where('start_time LIKE ?', date)
            elsif !params[:date][:year].blank? && params[:date][:month].blank? && params[:date][:day].blank?
                year = params[:date][:year]
                date = "%" + year.to_s + "%"
                photoshoots = photoshoots.where('start_time LIKE ?', date)
            elsif params[:date][:year].blank? && !params[:date][:month].blank? && params[:date][:day].blank?
                month = params[:date][:month]
                if month.to_i < 10
                    month = "0" + month.to_s
                end
                date = "%-" + month + "-%"
                photoshoots = photoshoots.where('start_time LIKE ?', date)
            end
        end
        photoshoots
    end

end
