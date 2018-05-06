class RenameDevicesToNodeDevices < ActiveRecord::Migration[5.1]
  def change
    rename_table :devices, :node_devices
  end
end
