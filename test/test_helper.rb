# rubocop:disable Style/FetchEnvVar
ENV['RAILS_ENV'] ||= 'test'
# rubocop:enable Style/FetchEnvVar
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
