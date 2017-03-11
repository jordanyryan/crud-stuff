class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :subscriptions
  has_many :channels, through: :subscriptions

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}

  has_secure_password

end
