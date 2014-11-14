class App < ActiveRecord::Base
  has_many :users

  after_create :assert_api_key_presence


  def assert_api_key_presence
    binding.pry
    if !self.api_key || ( self.api_key && self.api_key.length < 32)
      binding.pry
      self.api_key = SecureRandom.hex(32)
      self.save
    end
  end
end
