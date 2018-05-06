class NodeDevicesAddColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :node_devices, :user_id, :integer, null: false
    add_column :node_devices, :description, :string, null: true
    add_foreign_key(
      :node_devices,
      :users,
      column: :user_id
    )
  end
end
