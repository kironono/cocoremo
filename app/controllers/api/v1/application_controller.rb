class Api::V1::ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  attr_reader :current_user

  # before_action -> { doorkeeper_authorize! :read }, only: %i(index show)
  # before_action only: %i(create update destroy) do
  #   doorkeeper_authorize! :write
  # end

  def not_found
    payload = {
      meta: {
        version: 1,
        code: 404,
        message: "Not found"
      }
    }
    render json: payload, status: 404
  end

  private

  def current_user
    return nil if doorkeeper_token.blank?
    @current_user ||= User.find(doorkeeper_token.resource_owner_id)
  end

  def render_validation_errors(errors)
    payload = {
      meta: {
        version: 1,
        code: 400,
        message: "Invalid parameter error"
      },
      data: {
        errors: errors.full_messages
      }
    }
    render json: payload, status: 400
  end

end
