class User < ActiveRecord::Base 
    #each user has many hangs
    has_secure_password
end