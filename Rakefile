task :run, [:port] do |t, args|
    desc 'Run the server'
    puts 'Starting the server'
    args.with_defaults(port: 9292)
    sh "rackup config.ru -p #{args.port}"
end

task :createdb do |t|
    desc 'create the database'
    sh 'ruby database/createdb.rb'
end