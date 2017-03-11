class Subscription < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :channel
  belongs_to :user
end
