rails_env = ENV['RAILS_ENV'] || 'production'

worker_processes (rails_env == 'production' ? 16 : 4)

preload_app true

timeout 30

before_fork do |signal, worker|
    Signal.trap 'USR2' do
        puts 'Intercepting term signal'
        Process.kill 'QUIT', Process.pid
    end

    defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |signal, worker|
    Signal.trap 'USR2' do
        puts 'Intercepting term signal'

        defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
    end
end
