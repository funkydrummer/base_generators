require 'test_helper'

class CrudControllerGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper

  test "assert all files are properly created" do
    run_generator %w(User)

    assert_file "app/controllers/users_controller.rb"
  end

  test "methods are added" do
    run_generator %w(User)

    assert_file "app/controllers/users_controller.rb" do |controller|
      %i(index show new create edit update destroy load_users load_user build_user save_user user_params user_scope).each do |method_name|
        assert_instance_method method_name, controller
      end
    end
  end
end
