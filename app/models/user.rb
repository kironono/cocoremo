class User < ApplicationRecord

  has_many :access_grants, class_name: "Doorkeeper::AccessGrant",
    foreign_key: :resource_owner_id,
    dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens, class_name: "Doorkeeper::AccessToken",
    foreign_key: :resource_owner_id,
    dependent: :delete_all # or :destroy if you need callbacks

  has_many :node_devices, foreign_key: :user_id, dependent: :destroy
  has_many :home_appliances, foreign_key: :user_id, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

end
