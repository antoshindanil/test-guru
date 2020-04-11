# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    end

    def after_sign_in_path_for(resource)
      if resource.admin?
        flash[:notice] = "Hello, #{current_user.first_name}!"
        admin_tests_path
      else
        flash[:notice] = "Hello, #{current_user.email}!"
        super
      end
    end
end
