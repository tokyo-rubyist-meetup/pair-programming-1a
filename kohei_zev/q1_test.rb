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
    assert_equal "889",KanaToNumber.convert("ハヤク")
    assert_equal "758",KanaToNumber.convert("ナゴヤ")
    assert_equal "931",KanaToNumber.convert("クサイ")
    assert_equal "315",KanaToNumber.convert("サイゴ")
  end
  
  def test_harder
    assert_equal "18782",KanaToNumber.convert("イヤナヤツ")
  end
  def test_harder_more
    assert_equal "39",KanaToNumber.convert("サンキュー")
  end
end


