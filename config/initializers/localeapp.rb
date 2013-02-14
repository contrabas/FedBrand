require 'localeapp/rails'

Localeapp.configure do |config|
  config.polling_environments = [:development]
  config.poll_interval = 6000
  config.reloading_environments << :production
  config.sending_environments = []
  config.api_key = '21MkML5TBAKxvtIecUVwgVikYJJ0OfRQpdpFubdTie6ltQG8UT'
end
