class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!


     protected

         

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :avatar)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :avatar)}
          end
end
