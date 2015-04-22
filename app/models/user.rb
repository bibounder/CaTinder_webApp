class User < ActiveRecord::Base
  include UuidIdentifiable

  has_secure_password
end
