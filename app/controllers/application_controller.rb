# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def default_url_options
    { lang: I18n.locale }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      flash[:notice] = t('.after_sign_in_hello', name: current_user.first_name)
      admin_tests_path
    else
      flash[:notice] = t('.after_sign_in_hello', name: current_user.email)
      super
    end
  end

private
  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
