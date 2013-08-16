# Load the Rails application.
require File.expand_path('../application', __FILE__)

USER_DETAILS = YAML::load_file Rails.root.join('config', 'user_details.yml')

# Initialize the Rails application.
NGTSPrototypeStatus::Application.initialize!
