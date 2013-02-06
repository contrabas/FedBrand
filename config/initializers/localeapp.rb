require 'localeapp/rails'

Localeapp.configure do |config|
  # allow localeapp to check for new translations in production
  config.polling_environments << :production
  # the number of seconds to wait between checking for new translations
  # enter `0` to check on every request
  config.poll_interval = 600
  # when new translations have been downloaded, reload I18n
  config.reloading_environments << :production
  # do not send missing translations to Locale
  config.sending_environments = []

  config.api_key = '21MkML5TBAKxvtIecUVwgVikYJJ0OfRQpdpFubdTie6ltQG8UT'
end
