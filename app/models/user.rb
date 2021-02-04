class User < ActiveRecord::Base 
    has_many :hangs #each user has many hangs
    has_secure_password
end