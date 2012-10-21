require 'rspec'

def a_to_map(a)
	target = a[0]
	m = Hash.new
	a.slice(1..-1).each {|value| m[value] = target}
	m
end

describe "a_to_map" do
	it "should convert array with number to map to number" do
		a_to_map(["0", "a", "b"]).should == {"a" => "0", "b" => "0"}
	end
end
