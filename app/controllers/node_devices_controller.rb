class NodeDevicesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_device, only: [:edit, :update]

  # GET /devices
  def index
    @node_devices = NodeDevice.where(user: current_user)
  end

  # GET /devices/1/edit
  def edit
  end

  # PATCH/PUT /devices/1
  def update
    if @node_device.update(device_params)
      redirect_to @node_device, notice: 'NodeDevice was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @node_device = NodeDevice.where(user: current_user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.fetch(:node_device, {})
    end
end
