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

    assert_equal("91(mod 120)", CRT::CRT.new(3, 1, 1, 8, 3, 5).result)
    assert_equal("53(mod 60)", CRT::CRT.new(1, 2, 3, 4, 3, 5).result)
    assert_equal("37(mod 187)", CRT::CRT.new(4, 3, 11, 17).result)
    assert_equal("1837(mod 2310)", CRT::CRT.new(2, 1, 3, 0, 5, 6, 7, 11).result)
  end
end
