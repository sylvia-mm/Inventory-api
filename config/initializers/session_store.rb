# # config/initializers/session_store.rb
# Rails.application.config.session_store :cookie_store, key: '_inventory_hub_session', same_site: :none, secure: false
Rails.application.config.session_store :cookie_store, key: '_inventory_hub_session', same_site: :none, secure: false, domain: :all, tld_length: 2
