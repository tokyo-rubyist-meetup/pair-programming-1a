# -*- coding: utf-8 -*-

dictionary = {
  "0" => "まる ま れい れ オウ ゼロ ゼ",
  "1" => "ひとつ ひと ひ いち い ワン",
  "2" => "ふたつ ふた ふ  に ツ",
  "3" => "みつ み さん さ スリー",
  "4" => "よん よ よつ  し フォー",
  "5" => "いつつ いつ ご こ ファイブ ファイヴ",
  "6" =>  "むつ む  ろく ろ シックス",
  "7" =>  "ななつ なな な しち セブン セヴン",
  "8" =>  "やつ や はち は ば  エート",
  "9" =>  "ここのつ こ きゅう く ナイン",
  "10" => "とお じゅう じ テン"
}

orig_input = "よろしく"

input = "よろしく"

def extract(dictionary, input, orig_input)
  input.size.times do |n|
    p input
    p orig_input

    dictionary.each do |key, value|
      if value.match(/(#{input})/)
        p "aaaaa"
        p orig_input
        p "bbbbb"
        orig_input.gsub!($1, "")
        return [key, orig_input]
      end
    end

    input.gsub!(input[-1], "")
  end
end


ret = extract(dictionary, input, orig_input)
p ret[1]

p extract(dictionary, ret[1], ret[1])
# we don't have the time to implement... o_O

# input
# よろしく
# よろし
# よろ
# よ
# ↓
# input
# ろしく
# ろし
# ろ

