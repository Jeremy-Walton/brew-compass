# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create
  before_action :configure_account_update_params, only: :update # rubocop:disable Rails/LexicallyScopedActionFilter

  # POST /resource
  def create
    params[:user][:role] = User.roles[:admin]
    super
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[
        first_name
        last_name
        role
      ]
    )
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[
        first_name
        last_name
      ]
    )
  end
end
