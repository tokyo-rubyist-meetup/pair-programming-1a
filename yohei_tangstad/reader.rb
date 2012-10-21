# encoding: UTF-8

require 'rspec'

class TableReader
	def parseline(line)
		a = Array.new
		a.push(line)
		a
	end
end

describe TableReader do
	describe "#parseline" do
		it "should return all hiragana words in a line" do
			tr = TableReader.new
			tr.parseline("ひらがな").should == ["ひらがな"]
		end
	end
end

