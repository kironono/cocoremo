class CreateHomeAppliancesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :home_appliances do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :description, null: true
      t.string :appliance_kind, null: false
      t.string :uuid, null: false

      t.timestamps
    end
    add_foreign_key(
      :home_appliances,
      :users,
      column: :user_id
    )
  end
end
