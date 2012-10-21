# -*- coding: utf-8 -*-

require 'rspec'

class String
  def split_characters(chars)
    array = [strip]
    chars.each_char{ |c|
      temp_array = []
      array.each{|s|
        temp_array.concat s.split(c)
	temp_array.delete_if{|a| a==""}
      }
      array = temp_array
    }
    # result = split('|')
    return array.map{|l| l.strip}
  end
end

#"".split_characters
given_data = open('./data.txt').read

given_data.each_line {|d|
  puts d.split_characters('|、').to_s
}



describe "split_characters" do
	it "should split on character" do
		"one two".split_characters(" ").should == ["one", "two"]
	end
	it "should split on multiple characters" do
		"one two,three, four".split_characters(" ,").should == ["one", "two", "three", "four"]
	end
	it "should split our input properly" do
		"0      | まる、ま                  | れい、れ                 | おう 、ぜろ、ぜ ".split_characters("| 、").should == ["0", "まる", "ま", "れい", "れ", "おう", "ぜろ", "ぜ"]
	end
end





