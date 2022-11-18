require './app'
require 'bundler'

Bundler.require(:default)

builder = Rack::Builder.new do 
    use Rack::Cors do
        allow do 
            origins '*', 'localhost'
            resource '*', :headers => :any, :methods => [:get, :post, :put, :delete, :options]
        end
    end

    run App
end


run builder.to_app

