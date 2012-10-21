# -*- coding: utf-8 -*-
require "nkf"

def dic
  { 'よ' => 4, 'ろ' => 6, 'しち' => 7 }
end

class String

  # '0' => [まる,ま,れい,れ,オウ,ゼロ,ゼ]
  # '1' => [ひとつ,ひと,ひ,いち,い,ワン]
  # 2 ふたつ、ふた、ふ に ツ
  # 3 みつ、み さん、さ スリー
  # 4 よん、よ、よつ し フォー
  # 5 いつつ、いつ ご、こ ファイブ、ファイヴ
  # 6 むつ、む ろく、ろ シックス
  # 7 ななつ、なな、な しち セブン、セヴン
  # 8 やつ、や はち、は、ば エート
  # 9 ここのつ、こ きゅう、く ナイン
  # 10 とお じゅう、じ テン

  def to_number
    self.to_hiragana.split(//).map {|c| dic[c]}.join('').to_i
  end

  def to_hiragana
    NKF.nkf("-w -h1", self)
  end
end
