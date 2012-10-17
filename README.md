# Japanese Numeric Substitution

Numbers can be pronounced multiple ways in Japanese, based on the onyomi and kunyomi readings, and also transliterations from English. These pronunciations can be used for spelling out words. For example, yoroshiku can be written as 4649. The table below summarizes the different pronunciations.

Number | Japanese kunyomi readings | Japanese onyomi readings | Transliterations from English readings
------ | ------------------------- | ------------------------ | -------------------------------------- 
0      | まる、ま                  | れい、れ                 | オウ、ゼロ、ゼ 
1      | ひとつ、ひと、ひ          | いち、い                 | ワン 
2      | ふたつ、ふた、ふ          | に                       | ツ 
3      | みつ、み                  | さん、さ                 | スリー 
4      | よん、よ、よつ            | し                       | フォー 
5      | いつつ、いつ              | ご、こ                   | ファイブ、ファイヴ
6      | むつ、む                  | ろく、ろ                 | シックス
7      | ななつ、なな、な          | しち                     | セブン、セヴン
8      | やつ、や                  | はち、は、ば             | エート
9      | ここのつ、こ              | きゅう、く               | ナイン
10     | とお                      | じゅう、じ               | テン

Your task is to write a program that takes a word written in katakana, and returns the word as a number. Here are some sample words to get you started.

Word      | Input      | Output
--------- | ---------- | ------
よろしく  | ヨロシク   | 4649
嫌な奴    | イヤナヤツ | 18782
早く      | ハヤク     | 889
名古屋    | ナゴヤ     | 758
くさい    | クサイ     | 931
最後      | サイゴ     | 315
Thank You | サンキュー | 39

## Hints

```ruby
# encoding: UTF-8

require "nkf"
NKF.nkf("-w -h2", "かたかな") # カタカナ

/\p{Katakana}/ =~ "カタカナ" # 0
/\p{Katakana}/ =~ "かたかな" # nil
```

## Extensions

If you manage to solve the above in a beautiful manner, and still have time left, you can try solving one of the additional challenges below.

### ポケベル

Back when pagers (ポケベル) were popular in Japan, high-school girls sent messages using numeric substitution. Not only did they use the above, but also the shape of the number, for instance, o→0 and あい→I→1.  According to the [Japanese wikipedia article on this](http://ja.wikipedia.org/wiki/%E8%AA%9E%E5%91%82%E5%90%88%E3%82%8F%E3%81%9B), here are some additional words you can make.

Word     | Input        | Output
-------- | ------------ | ------
おはよう | オハヨウ     | 0840
愛してる | アイシテイル | 14106
何してる | ナニシテイル | 724106
さよなら | サヨナラ     | 3470

Figure out how to extend your program to handle these transliterations as well.

### Numbers to Words

Often in Japanese advertisements, above telephone numbers, there are words spelled out using the number's pronunciation to help you remember the phone number. Given a phone number as input, find any words in it.
