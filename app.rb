require 'bundler'
require 'pathname'

Bundler.require(:default)



class App < Roda
    plugin  :json
    plugin  :indifferent_params
    plugin  :all_verbs
    plugin  :hooks
    plugin  :render, escape: true, layout: '/layout'
    plugin  :public, root: Pathname.new(__dir__).join('public')

    before do 
        body = request.body.read
        @data = JSON.parse(body, symbolize_names: true) rescue {}

        puts "===#{__LINE__} --- #{__FILE__}==="
        puts "===#{__LINE__} --- #{__FILE__}==="
        
        p @data
    end

    app_root = Pathname.new(__dir__).join('.')

    Dir[app_root.join('server', 'models', '*.rb')].each { |file| require file}


    route do |r|
        r.public

        r.root do 
            view :login
        end

        r.on 'login' do 

            r.post do

                username = @data[:username]
                password = @data[:password]

                user = User.authenticate(username, password)

                puts "===#{__LINE__} --- #{__FILE__}==="
                
                p user

                if user
                    response.status = 200
                    {
                        message: 'Login successfull', user: user
                    }.to_json
                    
                else
                    response.status = 400
                    {
                        message: 'Login Failed'
                    }.to_json
                    
                end
            end
        end
    end
end