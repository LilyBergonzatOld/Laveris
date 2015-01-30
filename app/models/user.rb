class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :subscribed_events, :source => :event, :through => :subscriptions

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture")
  end

  def fullname
    self.name+' '+self.surname
  end
  
end
