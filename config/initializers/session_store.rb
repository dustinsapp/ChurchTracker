# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ChurchTracker_session',
  :secret      => 'f28e4b469e17857e423105e4eb52b14294b56a4885c6e5b325ad4c5c1207ec656fb46b849accfbb95d4f859d3c3620f284e2e04072896a2d568a9c3cc04f9f48'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
