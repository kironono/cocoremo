class NodeDevicesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @node_devices = NodeDevice.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @node_device = NodeDevice.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @node_device = NodeDevice.new(device_params)

    respond_to do |format|
      if @node_device.save
        format.html { redirect_to @node_device, notice: 'NodeDevice was successfully created.' }
        format.json { render :show, status: :created, location: @node_device }
      else
        format.html { render :new }
        format.json { render json: @node_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @node_device.update(device_params)
        format.html { redirect_to @node_device, notice: 'NodeDevice was successfully updated.' }
        format.json { render :show, status: :ok, location: @node_device }
      else
        format.html { render :edit }
        format.json { render json: @node_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @node_device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'NodeDevice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @node_device = NodeDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.fetch(:node_device, {})
    end
end
