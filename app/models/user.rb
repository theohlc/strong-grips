class User < ActiveRecord::Base 
    has_many :hangs #each user has many hangs
    has_secure_password

    def my_hangs
        Hang.all
    end
end