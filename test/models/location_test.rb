require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "location has name" do  
    assert_equal("fieldB", locations(:one).name)
  end

  test "location has leagueid" do  
    assert_equal(2, locations(:one).league_id)
  end

  test "location has lat" do  
    assert_equal(14.5, locations(:two).lat)
  end

  test "location has lng" do  
    assert_equal(0.512349, locations(:two).lng)
  end

end
