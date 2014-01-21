require 'test_helper'

class ViewGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper

  test "assert all files are properly created" do
    run_generator %w(User)
    
    assert_file "app/views/admin/users/index.html.haml"
    assert_file "app/views/admin/users/show.html.haml"
    assert_file "app/views/admin/users/new.html.haml"
    assert_file "app/views/admin/users/edit.html.haml"
    assert_file "app/views/admin/users/_form.html.haml"
  end
  
  test "assert skip actions" do
    run_generator %w(User --skip-index --skip-show --skip-new --skip-edit --skip-form)
    
    assert_no_file "app/views/admin/users/index.html.haml"
    assert_no_file "app/views/admin/users/show.html.haml"
    assert_no_file "app/views/admin/users/new.html.haml"
    assert_no_file "app/views/admin/users/edit.html.haml"
    assert_no_file "app/views/admin/users/_form.html.haml"
    assert_no_directory "app/views/admin/users"
  end
end
