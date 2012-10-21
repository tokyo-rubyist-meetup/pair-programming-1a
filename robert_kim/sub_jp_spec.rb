# encoding: utf-8

require 'rubygems'
require 'rspec'
require "#{File.dirname(__FILE__)}/sub_jp"

describe SubstituteJp do
  before do
    @word_in_test
  end
  subject {SubstituteJp.numericalize(@word_in_test)}
  it "should return nil" do
    SubstituteJp.numericalize("hoge").should eq ""
  end

  context "when given 'ヨロシク'" do
    before {@word_in_test = 'ヨロシク'}
    it {should eq "4649"}
  end

  context "when given 'イヤナヤツ'" do
    before {@word_in_test = 'イヤナヤツ'}
    it {should eq "18782"}
  end

  context "when given 'ハヤク'" do
    before {@word_in_test = 'ハヤク'}
    it {should eq "889"}
  end

  context "when given 'ナゴヤ'" do
    before {@word_in_test = 'ナゴヤ'}
    it {should eq "758"}
  end

  context "when given 'クサイ'" do
    before {@word_in_test = 'クサイ'}
    it {should eq "931"}
  end

  context "when given 'サイゴ'" do
    before {@word_in_test = 'サイゴ'}
    it {should eq "315"}
  end

  context "when given 'サンキュー'" do
    before {@word_in_test = 'サンキュー'}
    it {should eq "39"}
  end
end
