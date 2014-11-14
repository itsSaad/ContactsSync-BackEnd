class User < ActiveRecord::Base

  has_many :phones
  has_many :emails
  has_many :addresses
  has_many :instant_messengers
  has_many :social_profiles

  belongs_to :app


end
