require File.join(File.dirname(__FILE__), '..', 'lib', 'mongoid_rails_migrations')
require File.join(File.dirname(__FILE__), '..', 'lib', 'rails', 'generators', 'mongoid', 'mongoid_generator')

# Mongoid.configure.connect_to('mongoid_test')
Mongoid.configure.load_configuration({
  clients: {
    default: {
      database: ENV['MONGOID_DB'] || "mongoid_test",
      hosts: [ ENV['MONGOID_HOST'] || "localhost:27017" ],
    }
  }
})

# require all models
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }

MIGRATIONS_ROOT = File.join(File.dirname(__FILE__), 'migrations')
