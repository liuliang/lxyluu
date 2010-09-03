# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lxyluu_session',
  :secret      => '60c0f9cc1f0de7eca50982db09b491fb1c658b0f6b455bced6bc8be13bd7301546afbb9fe7a62f656e8370650551ecbf8433aa8e153230f49384ee4aa03c2fcc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
