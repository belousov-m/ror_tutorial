require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    assert_select 'a[href=?]', help_path
  end

  test "valid title in signup" do
    get signup_path
    assert_template 'users/new'
    assert_select "title", "Sign up | Ruby on Rails Tutorial Sample App"
  end
end
