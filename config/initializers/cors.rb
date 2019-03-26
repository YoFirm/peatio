# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors
require 'rack/cors'

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins CORS::Validations.validate_origins(ENV['API_CORS_ORIGINS'])
    resource '/api/*',
             methods: %i[get post delete put patch options head],
             headers: :any,
             credentials: ENV.true?('API_CORS_ALLOW_CREDENTIALS'),
             max_age: CORS::Validations.validate_max_age(ENV['API_CORS_MAX_AGE'])
  end
end
