ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'simplecov' 
SimpleCov.start 'rails'

require 'contexts'
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all
  include Contexts
  # Add more helper methods to be used by all tests here...
end
