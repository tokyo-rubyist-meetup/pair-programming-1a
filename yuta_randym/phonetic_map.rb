#  encoding: UTF-8
#
puts $1
require 'nkf'
class PhoneticMap

  def data
    @data ||= build_data
  end

  def index_of(string)
    data.each.with_index do |phonetic_equivelant, index|
      return index if phonetic_equivelant.include?(string)
    end
    nil
  end

  def build_data
    n = []
    n << %w(まる ま れい れ オウ ゼロ ゼ)
    n << %w(ひとつ ひと ひ いち い	ワン)
    n << %w(ふたつ ふた ふ に ツ)
    n << %w(みつ み さん さ スリー)
    n << %w(よん よ よつ し フォー)
    n << %w(いつつ いつ ご こ ファイブ ファイヴ)
    n << %w(むつ む ろく ろ シックス)
    n << %w(ななつ なな な しち セブン セヴン)
    n << %w(やつ や はち は ば エート)
    n << %w(ここのつ こ きゅう く ナイン)
    n.map do |phonetics|
      phonetics.map { |item| item = NKF.nkf("-w -h2", item) }
    end
  end

  def transliterate(kana)
    tmp = ''
    output = []
    kana.each_char do |char|
      tmp += char
      puts tmp
      if index = index_of(tmp)
        output << index
        tmp =''
      else
        tmp += char
      end
    end
    output.join('')
  end
end

if ARGV.size == 1
  _map = PhoneticMap.new
  puts _map.transliterate(ARGV.first)
end

