# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'parser'

class ParseTest < Test::Unit::TestCase
  LINES = [
    '1',
    '11',
    '21',
    '1211',
    '111221',
    '312211',
  ]

  def test_parse
    LINES.each_index do |i|
      assert_equal LINES[i+1], Parser.parse(LINES[i])  unless i == LINES.size-1
    end
  end

  def test_generate_sequence
    Parser.generate('1', LINES.size-1) do |str, counter|
      assert_equal LINES[counter], str
    end
  end

  def test_generate_rvalue
    assert_equal LINES[-1], Parser.generate('1', LINES.size-1)
  end
end
