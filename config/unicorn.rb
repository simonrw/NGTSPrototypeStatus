rails_env = ENV['RAILS_ENV'] || 'production'

worker_processes (rails_env == 'production' ? 16 : 4)

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
    GC.copy_on_write_friendly = true

timeout 30

before_fork do |signal, worker|
    defined?(ActiveRecord::Base) and 
        ActiveRecord::Base.connection.disconnect!
end

after_fork do |signal, worker|
    defined?(ActiveRecord::Base) and 
        ActiveRecord::Base.establish_connection
end
