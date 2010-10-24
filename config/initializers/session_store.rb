# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_beka_session',
  :secret      => '1b857261d1cefa96a6583523f96bbf7c5d7e1f0f7d4b4fa0dec1c81af2ab4f58ebbfa68251bb3662c3e19d2a4c1d1c1997f134ec9b80fbc0e69eb8d28e53d47b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
