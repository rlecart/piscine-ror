require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "User's relations methods" do
    eval(POPULATE)
    test_user = User.last
    foo =  test_user.like.count
    assert_equal(foo, 1)
    foo = test_user.comment.count
    assert_equal(foo, 2)
    foo = test_user.cuicui.count
    assert_equal(foo, 0)
  end
end
