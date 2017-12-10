require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GauravPortfolio
  class Application < Rails::Application
    config.eager_load_paths << "#{Rails.root}/lib"
  	config.secret_key_base = ENV["SECRET_KEY_BASE"]
  end
end
