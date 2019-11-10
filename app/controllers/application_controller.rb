class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale

  def logged_in_user
    return if logged_in?
    store_location
    redirect_to login_url
  end

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale =
      if I18n.available_locales.include? locale
        locale
      else
        I18n.default_locale
      end
  end
end
