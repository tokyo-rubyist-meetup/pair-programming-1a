# encoding: utf-8
require "jcode"

BANGO = {
  0 => %w(まる ま れい れ	オウ ゼロ ゼ)     ,
  1 => %w(ひとつ ひと ひ	いち い	ワン)      ,
  2 => %w(ふたつ ふた ふ	に	ツ)           ,
  3 => %w(みつ み	さん さ	スリー)         ,
  4 => %w(よん よ よつ	し	フォー)           ,
  5 => %w(いつつ いつ	ご こ	ファイブ ファイヴ)   ,
  6 => %w(むつ む	ろく ろ	シックス)        ,
  7 => %w(ななつ なな な	しち	セブン セヴン)   ,
  8 => %w(やつ や	はち は ば	エート)       ,
  9 => %w(ここのつ こ	きゅう く	ナイン)       ,
 10 => %w(とお	じゅう じ	テン)            ,
}

bango2 = {}

BANGO.map { |number, yomis|
  yomis.map { |yomi|
    bango2[yomi] = number
  }
}

puts bango2


#input = "ヨロシク"
input = "よろしく"
input = "いやなやつ"

input.split("").map{ |letter| 
  puts "#{letter} ---> #{bango2[letter]}" 
  
}

# output => 4649