class User < ActiveRecord::Base
  include Authentication

  has_many :events
end
