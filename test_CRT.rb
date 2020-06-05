require "test/unit"
require_relative "CRT.rb"

class TestCRT < Test::Unit::TestCase
  def test_CRT
    crt = CRT::CRT.new(1, 5, 4, 10, 5, 6, 7, 11)
    
    assert_equal(crt.b1, 1)
    assert_equal(crt.b2, 5)
    assert_equal(crt.b3, 4)
    assert_equal(crt.b4, 10)

    assert_equal(crt.m1, 5)
    assert_equal(crt.m2, 6)
    assert_equal(crt.m3, 7)
    assert_equal(crt.m4, 11)

    assert_equal(crt.mm1, 462)
    assert_equal(crt.mm2, 385)
    assert_equal(crt.mm3, 330)
    assert_equal(crt.mm4, 210)

    assert_equal(crt.mmi1, 3)
    assert_equal(crt.mmi2, 1)
    assert_equal(crt.mmi3, 1)
    assert_equal(crt.mmi3, 1)

    assert_equal(crt.almost, 2111)
    assert_equal(crt.result, "2111(mod 2310)")
  end
end