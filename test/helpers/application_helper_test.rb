#encoding :utf-8
require "test_helper"
require 'test/unit'

class TestHelper < ActionView::Base
  include ApplicationHelper
end

class ApplicationHelperTest < Test::Unit::TestCase
  def setup
    @helper = TestHelper.new
  end

  def test_to_br
    assert_equal("１２３<br />あいう", @helper.to_br("１２３\nあいう"))
  end
end
