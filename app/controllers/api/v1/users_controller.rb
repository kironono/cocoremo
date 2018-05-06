class Api::V1::UsersController < Api::V1::ApplicationController

  before_action :set_user, only: [:show]

  def show
  end

  private

  def set_user
    @user = current_user
  end

end
