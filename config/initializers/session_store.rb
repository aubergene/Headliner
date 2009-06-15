# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_headline_guess_session',
  :secret      => 'b85634ec106e2c776076f2938a88db57f49baf1a4f088a86f8e9427319a0729c0cfd0c5388dc2fa68f406b5d9948521619e0210cf3b47004f7d27a1c66bc7cb2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
