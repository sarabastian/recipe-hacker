require 'bundler'
# require 'rest-client'
# require 'open-uri'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

# ActiveRecord::Base.logger = nil