class CreateNodeDeviceRegistrationRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :node_device_registration_requests do |t|
      t.string :token, null: false
      t.string :pin, null: false
      t.integer :expires_in, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
