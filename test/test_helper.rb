# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

module GeneratorsTestHelper
  def self.included(base)
    base.class_eval do
      destination File.join(Rails.root, "tmp")
      setup :prepare_destination

      begin
        base.tests "BaseGenerators::Admin::#{base.name.sub(/Test$/, '')}".constantize
      rescue
      end

      begin
        base.tests "BaseGenerators::#{base.name.sub(/Test$/, '')}".constantize
      rescue
      end
    end
  end
end

# https://github.com/rails/rails/blob/334e260c5fae975fc222b5f2db19638625fec556/railties/lib/rails/generators/testing/assertions.rb#L98
def assert_no_instance_method(method, content)
  assert content !~ /(\s+)def #{method}(\(.+\))?(.*?)\n\1end/m, "Expected to don't have method #{method}"
  yield $3.strip if block_given?
end
