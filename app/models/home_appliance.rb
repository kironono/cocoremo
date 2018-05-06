class HomeAppliance < ApplicationRecord

  belongs_to :user

  validates :name, presence: true
  validates :appliance_kind, presence: true
  validates :uuid, presence: true

end
