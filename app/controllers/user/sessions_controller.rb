# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  respond to: :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: {
        code: 200,
        message: 'Signed in successfully'
      }
    }, status: :ok  
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: {
          code: 200,
          message: 'Signed out successfully'
        }
      },
      status: :ok
    else
      render json: {
        status: {
          code: 401,
          message: 'Not signed in'
        }
      }, status: :unauthorized
  end
end
