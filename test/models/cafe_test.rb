require 'test_helper'

class CafeTest < ActiveSupport::TestCase
  test "close cafes" do
    far_cafe = Cafe.create!(
      name:      "Far Cafe",
      latitude:   40.000000,
      longitude: -77.000000
    )

    close_cafe = Cafe.create!(
      name:      "Close Cafe",
      latitude:   39.010000,
      longitude: -75.990000
    )

    close_cafes = Cafe.close_to(39.000000, -76.000000).load

    assert_equal 1,          close_cafes.size
    assert_equal close_cafe, close_cafes.first
  end
end
