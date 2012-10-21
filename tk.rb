#!/usr/bin/env ruby
# encoding: utf-8
#require 'nkf'

inputs = ["ヨロシク", "イヤナヤツ,", "ハヤク", "ナゴヤ", "クサイ", "サイゴ," ,"サンキュー"]

tr_table = %w[[マル,マ,レイ,オウ,ゼロ,ゼ] 
		[ヒトツ,ヒト,ヒ,イチ,イ,ワン] 
	       [フタツ,フタ,ニ,ツ]
				    [ミツ,ミ,サン,サ,スリー]
					 [ヨン,ヨ,ヨツ,シ,フォー]
					      [イツツ,イツ,ゴ,コ,ファイブ,ファイヴ]
						   [ムツ,ム,ロク,ロ,シックス]
							[ナナツ,ナナ,ナ,シチ,セブン,セヴン]
							     [ヤツ,ヤ,ハチ,ハ,バ,エート]
								  [ココノツ,コ,キュウ,ク,ナイン]
								       [トオ,ジュウ,ジ,テン]]

  inputs.each do
  |word|
  scores = []

  tr_table.to_enum.with_index do
    |v,i|
    v.each do
      |to_match|
      scores << word.scan(to_match)
    end
  end
  end
