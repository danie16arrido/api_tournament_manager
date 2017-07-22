require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  test "Leagues have name" do
    assert_equal( "League A", leagues(:one).name)
  end

end
