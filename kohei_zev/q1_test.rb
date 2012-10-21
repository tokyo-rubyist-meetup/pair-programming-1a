#coding:utf-8

require_relative "q1"
require "minitest/autorun"

class TestQ1 < MiniTest::Unit::TestCase
  def test_raise_on_unmatchable
    assert_raises(RuntimeError) do
      KanaToNumber.convert("テスト")
    end
  end
  
  def test_good_one
    assert_equal "749",KanaToNumber.convert("ななつしく")
  end
end


