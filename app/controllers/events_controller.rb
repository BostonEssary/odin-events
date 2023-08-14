class EventsController < ApplicationController
    
    skip_before_action :authenticate_user!, only: [:index]
  

    def index
        @events = Event.all
    end

    def new
        @event = Event.new()
    end
    def show
        @event = Event.find(params[:id])
        @time = @event.event_time.strftime("%I:%M %p")
        @date = @event.event_date.strftime("%B %d, %Y")
    end


    def create
        @user = current_user
        @event = Event.new(event_params)
        @event.creator = @user

        if @event.save

            redirect_to root_path
        else

            render :new, status: :unprocessable_entity
        end

    end

    def attend
        @user = current_user
        @event = Event.find(params[:id])

        if @event.attendees.include?(@user)
            redirect_to @event, notice: 'You are already attending this event!'
        else
            @event.attendees << @user
            redirect_to @event, notice: 'You are now attending this event!'
        end

    end


    private

    def event_params
        params.require(:event).permit(:event_date, :event_time, :title, :description, :event_header)
    end
end
