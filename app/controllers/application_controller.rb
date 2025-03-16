# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # Disabled for now so I can do proper lighthouse testing
  # allow_browser versions: :modern

  before_action :authenticate_user!
end
