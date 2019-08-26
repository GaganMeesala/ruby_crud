require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyCrud
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # For loading lib folder files
    config.autoload_paths << Rails.root.join('lib')
    # To avoid authenticity token
    config.api_only = false

    # To enforce UTF-8 (while creating database)
    # config.encoding = "utf-8"

    # Accepting for cross origin request
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options]
      end
    end
  end
end
