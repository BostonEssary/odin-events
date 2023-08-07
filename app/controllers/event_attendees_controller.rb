class EventAttendeesController < ApplicationController

   def new
      @event_attendee = EventAttendee.new()
   end
   
   def create
      @event_attendee = EventAttendee.new(event_attendee_params)
   end




   private

   def event_attendee_params
        params.require(:event_attendee).permit(:attended_event, :attendee)
   end
end
