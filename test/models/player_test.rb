require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test "Player has name" do
    assert_equal("Dan", players(:one).name )
  end

  test "Player has lastname" do 
    assert_equal( "Garrido", players(:one).last_name)
  end

  test "Player has age" do 
    assert_equal( 666, players(:one).age)
  end

  test "Player has weight" do 
    assert_equal( 79.88, players(:two).weight)
  end

  test "Player has height" do 
    assert_equal( 1.78, players(:two).height)
  end

  test "Player starts with 0 cups" do 
    assert_equal( 0 , players(:two).cups )
  end

end
