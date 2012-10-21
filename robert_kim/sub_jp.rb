# encoding: utf-8

require "nkf"


module SubstituteJp
  CONVERSION_HASH =
    {
    0 => ["まる", "ま", "れい", "れ", "オウ", "ゼロ", "ゼ"],
    1 => ["ひとつ", "ひと", "ひ","いち", "い", "ワン"],
    2 => ["ふたつ", "ふた", "ふ", "に", "ツ"],
    3 => ["みつ", "み", "さん", "さ", "スリー"],
    4 => ["よん", "よ", "よつ", "し", "フォー"],
    5 => ["いつつ", "いつ", "ご", "こ", "ファイブ", "ファイヴ"],
    6 => ["むつ", "む", "ろく", "ろ", "シックス"],
    7 => ["ななつ", "なな", "な", "しち", "セブン", "セヴン"],
    8 => ["やつ", "や", "はち", "は", "ば", "エート"],
    9 => ["ここのつ", "こ", "きゅう", "く", "ナイン"],
    10 => ["とお", "じゅう", "じ", "テン"]
  }

  def self.numericalize(word)
    numericalized = ""
    word.each_char do |c|
      if n = lookup(c)
        numericalized += n.to_s
      end
    end
    numericalized
  end

  def self.lookup(c)
    # katakanaize
    # k = NKF.nkf("-w -h2", c)

    # hiraganize
    h = NKF.nkf("-w -h1", c)
    CONVERSION_HASH.each do |number, words|
      return number if words.include?(h)
    end
    return ""
  end
end
