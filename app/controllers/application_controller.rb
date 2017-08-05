class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

      # before_filter :configure_permitted_paramaters, if: :devise_controller?
      #  Not considered as the best practice 5
      #  As each should be allowed only one responsibility
      # def configure_permitted_paramaters
      #    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      #    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      # end
   include DeviseWhitelist
end
