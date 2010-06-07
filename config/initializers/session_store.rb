# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_youroom_gadget_session',
  :secret      => '5b87c0d74769d55eb54d9b7cb1dcb89ae02c2a3d3a42aba93cd55c0c8ded082a0d38e0f363f9694ba0552db859f473310f2388874701a463eebe302eadd855c1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
