require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')


class TestPub < Minitest::Test

  def setup
    @pub = Pub.new("The Anchor", [])
  end

  def test_pub_name()
    assert_equal("The Anchor", @pub.name)
  end
end
