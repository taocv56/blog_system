require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @micropost = microposts(:orange)
    #@Comment = Comment.new(content: "Lorem ipsum", user_id: @user.id, micropost_id: @micropost.id)
    @Comment = @micropost.comments.build(content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @Comment.valid?
  end

  test "user id should be present" do
    @Comment.user_id = nil
    assert_not @Comment.valid?
  end
  
  test "micropost id should be present" do
    @Comment.micropost_id = nil
    assert_not @Comment.valid?
  end
  
    test "content should be present " do
    @Comment.content = "   "
    assert_not @Comment.valid?
  end

  test "content should be at most 140 characters" do
    @Comment.content = "a" * 141
    assert_not @Comment.valid?
  end

  test "order should be most recent first" do
    assert_equal Comment.first, comments(:most_recent)
  end
end