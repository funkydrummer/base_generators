require 'test_helper'

class ControllerGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper

  test "assert all files are properly created" do
    run_generator %w(User)

    assert_file "app/controllers/admin/users_controller.rb"
  end

  test "private methods are added" do
    run_generator %w(User)

    assert_file "app/controllers/admin/users_controller.rb" do |controller|
      assert_instance_method :collection, controller
      assert_instance_method :permitted_params, controller
    end
  end

  test "private methods are optional ommitted" do
    run_generator %w(User --skip-private-methods)

    assert_file "app/controllers/admin/users_controller.rb" do |controller|
      assert_no_instance_method :collection, controller
      assert_no_instance_method :permitted_params, controller
    end
  end
end
