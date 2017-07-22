require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "Teams have name" do
    assert_equal( "Team A", teams(:one).name)
  end

  test "Teams have league id" do
    assert_equal( 5, teams(:two).id)
  end
end
