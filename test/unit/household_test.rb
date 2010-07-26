require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase
  
  def setup
    @household = Household.new
    @household.valid?
  end
  
  test "should not be valid without name" do
    assert_equal(@household.errors.on(:name), "can't be blank")
  end
end
