#  encoding: UTF-8
$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/"

require 'phonetic_map'

require 'test/unit'
class TestPhoneticMap < Test::Unit::TestCase

  def setup
    @data = PhoneticMap.new
  end

  def test_initialize
    assert(@data.data.is_a?(Array))
  end
  def test_index_of_yo
    assert_equal(0, @data.index_of('マ'))
  end

  def test_not_found
    assert_equal(nil,@data.index_of('foo'))
  end

  def test_multiple_char
    assert_equal(7, @data.index_of('ナナツ'))
  end

  def test_multiple_char
    assert_equal(6, @data.index_of('ロ'))
  end

end

