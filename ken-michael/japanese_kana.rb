# -*- coding: utf-8 -*-

require "nkf"

module JapaneseKana
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
    %w[ここのつ こ きゅう キュー く ナイン] => 9,
    %w[とお じゅう じ テン] => 10 }

  TABLE = {}
  RAW_TABLE.each{|keys,v| keys.each{|k| TABLE[NKF.nkf("-w -h2", k)] = v.to_s }}

  def self.to_num(word)
    4.downto(1).each do |count|
      TABLE.find_all {|k,v| k.length == count }.each do |k,v|
        word = word.gsub(k,v)
      end
    end
    word
  end
end


require "rspec"

describe JapaneseKana do

  [ %w[ゼロツ 02],
    %w[ヨロシク 4649],
    %w[イヤナヤツ 1878],
    %w[ハヤク 889],
    %w[ナゴヤ 758],
    %w[クサイ 931],
    %w[サイゴ 315],
    %w[サンキュー 39] ].each do |w,n|
    it("should convert #{w} to #{n}") { JapaneseKana.to_num(w).should == n }
  end
end
