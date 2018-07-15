ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
# testのlogに色付け
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # テスト環境でもapplicationhelperを使えるようにする
  include ApplicationHelper
  # Add more helper methods to be used by all tests here...
end
