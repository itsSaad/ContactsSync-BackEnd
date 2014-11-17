class User < ActiveRecord::Base

  has_many :contacts


  after_create :assert_user_identifier

  def assert_user_identifier
    if(!self.identifier)
      self.identifier = SecureRandom.hex(32)
      self.save
    end
  end
end
