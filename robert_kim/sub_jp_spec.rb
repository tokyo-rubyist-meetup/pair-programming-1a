# encoding: utf-8

require 'rubygems'
require 'rspec'
require "#{File.dirname(__FILE__)}/sub_jp"

describe SubstituteJp do
  it "should return nil" do
    SubstituteJp.numericalize("hoge").should eq ""
  end
  context "when given 'ヨロシク'" do
    it "should return 4649" do
    SubstituteJp.numericalize("ヨロシク").should eq "4649"
    end
  end
end
