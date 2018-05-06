class HomeAppliancesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_home_appliance, only: [:edit, :update]

  def index
    @home_appliances = HomeAppliance.where(user: current_user)
  end

  def edit
  end

  def update
    if @home_appliance.update(home_appliance_params)
      redirect_to action: :index, notice: 'OK'
    else
      render :edit
    end
  end

  private

    def set_home_appliance
      @home_appliance = HomeAppliance.where(user: current_user).find(params[:id])
    end

    def home_appliance_params
      params.fetch(:home_appliance, {})
    end
end
