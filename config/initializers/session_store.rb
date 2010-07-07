# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_survey_session',
  :secret      => 'e0f90440b58f6194449d506cf8f497220f5a202f2514d67429aad1eb115405f4a49fb2fbb6105d51c3bc46c6ef18de534846b385035f59d48f27e70739819fc7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
