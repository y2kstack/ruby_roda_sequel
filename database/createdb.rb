require 'bundler'
Bundler.require(:default)


DB = Sequel.sqlite('./database/database.sqlite')

DB.drop_table? :users


DB.create_table :users do 
    primary_key :id

    String      :username, unique:true,
                :allow_null => false


    String      :email,
                :allow_null => false

    String      :password_digest,
                :default => nil

    String      :token,
                :default => nil

end


DB[:users].insert(:username => 'admin', :email => 'admin@localhost', :password_digest => BCrypt::Password.create('admin'), :token => nil)
DB[:users].insert(:username => 'user', :email => 'user@localhost', :password_digest => BCrypt::Password.create('user'), :token => nil)
DB[:users].insert(:username => 'guest', :email => 'guest@localhost', :password_digest => BCrypt::Password.create('guest'), :token => nil)

puts "Created and seeded Data to database"