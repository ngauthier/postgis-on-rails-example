require 'test_helper'

class CafeTest < ActiveSupport::TestCase
  test "closest cafes to a point" do
    far_cafe = Cafe.create!(
      name:      "Far Cafe",
      latitude:   40.000000,
      longitude: -77.000000
    )

    close_cafe = Cafe.create!(
      name:      "Close Cafe",
      latitude:   39.100000,
      longitude: -75.900000
    )

    assert_equal [close_cafe, far_cafe], Cafe.closest(39.000000, -76.000000)
  end
end
