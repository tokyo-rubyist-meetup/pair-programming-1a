#coding:utf-8

require "nkf"

class KanaToNumber
  
  def self.convert(string)
    Scanner.new(string, @transform).scan
  end
  
  # Big tranformation table
  transform = Hash.new # {|h,k| h[k] = [] }
  transform["マル"] = "0"
  transform["マ"] = "0"
  transform["レイ"] = "0"
  transform["レ"] = "0"
  transform["オウ"] = "0"
  transform["ゼロ"] = "0"
  transform["ゼ"] = "0"
  transform["ヒトツ"] = "1"
  transform["ヒト"] = "1"
  transform["ヒ"] = "1"
  transform["イチ"] = "1"
  transform["イ"] = "1"
  transform["ワン"] = "1"
  transform["フタツ"] = "2"
  transform["フタ"] = "2"
  transform["フ"] = "2"
  transform["ニ"] = "2"
  transform["ツ"] = "2"
  transform["ミツ"] = "3"
  transform["ミ"] = "3"
  transform["サン"] = "3"
  transform["サ"] = "3"
  transform["スリー"] = "3"
  transform["ヨン"] = "4"
  transform["ヨ"] = "4"
  transform["ヨツ"] = "4"
  transform["シ"] = "4"
  transform["フォー"] = "4"
  transform["イツツ"] = "5"
  transform["イツ"] = "5"
  transform["ゴ"] = "5"
  transform["コ"] = "5"
  transform["ファイブ"] = "5"
  transform["ファイヴ"] = "5"
  transform["ムツ"] = "6"
  transform["ム"] = "6"
  transform["ロク"] = "6"
  transform["ロ"] = "6"
  transform["シックス"] = "6"
  transform["ナナツ"] = "7"
  transform["ナナ"] = "7"
  transform["ナ"] = "7"
  transform["シチ"] = "7"
  transform["セブン"] = "7"
  transform["セヴン"] = "7"
  transform["ヤツ"] = "8"
  transform["ヤ"] = "8"
  transform["ハチ"] = "8"
  transform["ハ"] = "8"
  transform["バ"] = "8"
  transform["エート"] = "8"
  transform["ココノツ"] = "9"
  transform["コ"] = "9"
  transform["キュウ"] = "9"
  transform["ク"] = "9"
  transform["キュー"] = "9"
  transform["トオ"] = "10"
  transform["ジュウ"] = "10"
  transform["ジ"] = "10"
  transform["テン"] = "10"
  @transform = transform
  
end

class Scanner

  def initialize(source, transform_hash)
    @source = source
    @transform = transform_hash
    @current_pos = 0
    @result = ""
    explode_source
  end

  def to_katakana(s)
    NKF.nkf("-w -h2", s)
  end
  
  def explode_source
    @source_array = to_katakana(@source).split(//) 
  end
  
  def scan
    @current_pos = 0
    
    while @current_pos < @source_array.size
      r, npos = match(@source_array, @current_pos)
      if r.nil?
        raise "No match for #{@source} at pos #{@current_pos}"
      end
      @result<< r
      @current_pos = npos
    end
    
    @result
  end
  
  def match(strs, pos, hitting_key = "")
    #puts "db : #{hitting_key} pos #{pos} strs #{strs}"
    return [@transform[hitting_key], pos] if pos >= strs.size
    k = hitting_key + strs[pos]
    if @transform[k]
      match(strs, pos + 1, k)
    else
      [@transform[hitting_key], pos]
    end
  end
  
end
