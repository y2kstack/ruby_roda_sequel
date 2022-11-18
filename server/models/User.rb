
require 'bundler'

Bundler.require(:default)


DB = Sequel.connect('sqlite://database/database.sqlite')


class User < Sequel::Model DB[:users]
    


    def self.authenticate(username, password)
        user = User[:username => username]
        puts "===#{__LINE__} --- #{__FILE__}==="
        puts "===#{__LINE__} --- #{__FILE__}==="
        
        puts user 

        if user && BCrypt::Password.new(user.password_digest) == password
            {
                id: user.id,
                username: user.username,
                email: user.email
            }
        else
            nil
        end

    end


end