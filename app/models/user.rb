class User < ActiveRecord::Base 
    has_many :hangs 
    has_secure_password

    def my_hangs
        Hang.all
    end
end