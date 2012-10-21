# coding: utf-8

require 'rspec'
require './katakana_string.rb'

describe 'katakana input' do
  it "accepts the word よ and returns 4" do
    'よ'.to_number.should eq(4)
  end

  it "accepts the word ヨ and returns 4" do
    'ヨ'.to_number.should eq(4)
  end

  it "accepts the word しち and returns 7" do
    'しち'.to_number.should eq(7)
  end

  it "accepts the word ヨロ and returns 46" do
    'ヨロ'.to_number.should eq(46)
  end

  it "accepts the word ヨロシク and returns 4649" do
    'ヨロシク'.to_number.should eq(4649)
  end

  it "accepts katakana and returns hiragana" do
    'ヒラガナ'.to_hiragana.should eq 'ひらがな'
  end

# '''

# 嫌な奴 イヤナヤツ 18782
# 早く ハヤク 889
# 名古屋 ナゴヤ 758
# くさい クサイ 931
# 最後 サイゴ 315
# Thank You サンキュー 39
# '''
end
