require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "comment attributes must not be empty" do
  	comment = Comment.new
    assert comment.invalid?, "comment new is valid!"
    assert comment.errors[:commenter].any?
    assert comment.errors[:body].any?
    assert comment.errors[:product_id].any?
  end

  test "comment body length must be within [15,200]" do
  	comment = Comment.new(:commenter => 'John',
					  	  :body => 'Just in required words',
					  	  :product_id => 1)
  	comment.body = '1'
    assert(comment.invalid?, "must be within [15,200]")

  	comment.body = 'too short'
    assert(comment.invalid?, "must be within [15,200]")

	comment.body = "Too fucking long: \n\
		Like with any blog, our readers will\
	 create their comments directly after reading the arti\
	 cle, and once they have added their comment, will be \
	 sent back to the article show page to see their comme\
	 nt now listed. Due to this, our CommentsController is\
	  there to provide a method to create comments and del\
	  ete spam comments when they arrive.So first, we'll w\
	  ire up the Article show template (app/views/articles\
	  	/show.html.erb) to let us make a new comment:"
    assert(comment.invalid?, "must be within [15,200]")

	comment.body = 'Just with 15 ws'
    assert(comment.valid?, "comment body is valid")
  end

end
