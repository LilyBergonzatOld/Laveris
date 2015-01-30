class Event < ActiveRecord::Base
  has_many :subscriptions
  has_many :subscribed_users, :source => :user, :through => :subscriptions

  belongs_to :user
  belongs_to :laundromat
end