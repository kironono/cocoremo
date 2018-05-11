module HasPin
  extend ActiveSupport::Concern

  def generate_pin(options = {})
    _pin = nil
    loop do
      _pin = rand(000000..999999).to_s.rjust(6, "0")
      break unless self.class.where(pin: _pin).exists?
    end
    return _pin
  end
end
