class ApplicationController < ActionController::Base
  # before_action -> { sleep 1 }
  before_action :authenticate_user!, unless: :devise_controller?
end
