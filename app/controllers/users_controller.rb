class UsersController < ApplicationController

    def show
       @user = User.find(params[:id])
       @events = @user.attended_events
    end

    def profile
        @user = current_user
        @events = @user.attended_events
    end

    def edit
        @user = current_user
    end

end
