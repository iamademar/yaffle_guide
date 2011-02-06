require 'test_helper'

class WoodpeckerTest < Test::Unit::TestCase
  load_schema

  def test_woodpecker
    assert_kind_of Woodpecker, Woodpecker.new
  end
end
