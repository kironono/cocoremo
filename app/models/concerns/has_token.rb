module HasToken
  extend ActiveSupport::Concern

  def generate_token(options = {})
    generator = options.delete(:generator) || SecureRandom.method(:hex)
    token_size = options.delete(:size) || 32
    _token = nil
    loop do
      _token = generator.call(token_size)
      break unless self.class.where(token: _token).exists?
    end
    return _token
  end

end
