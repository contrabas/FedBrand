require 'localeapp/rails'

Localeapp.configure do |config|
  config.polling_environments = [:development]
  config.sending_environments = [:development]
  config.api_key = '21MkML5TBAKxvtIecUVwgVikYJJ0OfRQpdpFubdTie6ltQG8UT'
end
