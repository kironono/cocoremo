class NodeDeviceRegistrationRequest < ApplicationRecord

  include HasToken
  include HasPin

  validates :token, presence: true
  validates :pin, presence: true
  validates :expires_in, presence: true

  after_initialize :init

  private

  def init
    self.token ||= generate_token
    self.pin ||= generate_pin
    self.expires_in ||= (60 * 10)
  end
end
