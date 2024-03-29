class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attendees, foreign_key: :attended_event_id
    has_many :attendees, through: :event_attendees, source: :attendee
    has_one_attached :event_header
    validates_date :event_date, on_or_after: :today, message: "can not be in the past"



    def self.past
        where("event_date < ?", Date.today)
    end

    def self.future
        where("event_date > ?", Date.today)
    end

    def self.current
        where("event_date = ?", Date.today)
    end
end
