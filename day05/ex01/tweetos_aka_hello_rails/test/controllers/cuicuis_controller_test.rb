require 'test_helper'

class CuicuisControllerTest < ActionController::TestCase
  test "Cuicui's relations methods" do
    eval(POPULATE)
    test_cui = Cuicui.first
    foo = test_cui.user.name
    assert_equal(foo,'bob')
    comment_text = "hi!"
    foo = test_cui.comment.first.content
    assert_equal(foo, comment_text)
    foo = test_cui.user.last.name
    assert_equal(test_cui.like.count, 1)
    assert_equal(foo, "bob2", "you may explore the 'through:' option'")
  end
end
