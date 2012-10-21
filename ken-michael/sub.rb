# -*- coding: utf-8 -*-
module JapaneseNumericSub
  RAW_TABLE = {
    %w[まる ま れい れ オウ ゼロ ゼ] => 0,
    %w[ひとつ ひと ひ いち い ワン] => 1,
    %w[ふたつ ふた ふ に ツ] => 2,
    %w[みつ み さん さ スリー] => 3,
    %w[よん よ よつ し フォー] => 4,
    %w[いつつ いつ ご こ ファイブ ファイヴ] => 5,
    %w[むつ む ろく ろ シックス] => 6,
    %w[ななつ なな な しち セブン セヴン] => 7,
    %w[やつ や はち は ば エート] => 8,
    %w[ここのつ こ きゅう く ナイン] => 9,
    %w[とお じゅう じ テン] => 10 }

  TABLE = {}
  RAW_TABLE.each{|keys,v| keys.each{|k| TABLE[k] = v.to_s }}

  def self.sub(word)
    4.downto(1).each do |count|
      TABLE.find_all {|k,v| k.length == count }.each do |k,v|
        puts "checking for #{k},#{v}"
        word = word.gsub(k,v)
      end
    end
    word
  end

end


require "rspec"


describe JapaneseNumericSub do

  it { JapaneseNumericSub.sub("ゼロツ").should == "02" }
  
  [ %w[オハヨウ 0840], %w[アイシテイル 14106], %w[ナニシテイル 724106], %w[サヨナラ 3470] ].each do |w,n|
    it { JapaneseNumericSub.sub(w).should == n }
  end
end
