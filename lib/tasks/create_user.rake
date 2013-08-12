namespace :auth do
    desc "Create the user with which people can access the app"
    task :create => :environment do
        params = YAML::load_file Rails.root.join('config', 'user_details.yml')
        User.destroy_all
        User.create({ :email => params['email'], :password => params['password'], :password_confirmation =>  params['password']}).save(:validate => false)
    end
end
