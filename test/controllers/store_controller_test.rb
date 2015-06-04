# coding: utf-8
require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    # assert_select '#columns #side a', :minmun => 4 		# test <a> in id = columns, id = side: all fitting in at least  4
    # assert_select '#main .entry', 3  # test there are three class named entry
    # assert_select 'h3', 'Programming Ruby 1.9'
    # assert_select '.price', /\uFFE5[,\d]+\.\d\d/
  end

end
