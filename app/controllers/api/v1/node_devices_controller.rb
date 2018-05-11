class Api::V1::NodeDeviceController < Api::V1::ApplicationController

  def create
    @node_device_registration_request = NodeDeviceRegistrationRequest.new
    @node_device_registration_request.save!
  end

end
