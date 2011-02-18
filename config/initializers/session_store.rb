# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sorting_session',
  :secret      => 'd8144ece9fd164b9ebae4c2c4d9caecd722a2d661f2d622e92bebcda413e0d611d4fb45c0a262df9dbddc22bff580865c0d395c9b101eead169f05a5df260c18'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
