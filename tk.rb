#!/usr/bin/env ruby
# encoding: utf-8
#require 'nkf'

inputs = ["$B%h%m%7%/(B", "$B%$%d%J%d%D(B,", "$B%O%d%/(B", "$B%J%4%d(B", "$B%/%5%$(B", "$B%5%$%4(B," ,"$B%5%s%-%e!<(B"]

tr_table = %w[[$B%^%k(B,$B%^(B,$B%l%$(B,$B%*%&(B,$B%<%m(B,$B%<(B] 
		[$B%R%H%D(B,$B%R%H(B,$B%R(B,$B%$%A(B,$B%$(B,$B%o%s(B] 
	       [$B%U%?%D(B,$B%U%?(B,$B%K(B,$B%D(B]
				    [$B%_%D(B,$B%_(B,$B%5%s(B,$B%5(B,$B%9%j!<(B]
					 [$B%h%s(B,$B%h(B,$B%h%D(B,$B%7(B,$B%U%)!<(B]
					      [$B%$%D%D(B,$B%$%D(B,$B%4(B,$B%3(B,$B%U%!%$%V(B,$B%U%!%$%t(B]
						   [$B%`%D(B,$B%`(B,$B%m%/(B,$B%m(B,$B%7%C%/%9(B]
							[$B%J%J%D(B,$B%J%J(B,$B%J(B,$B%7%A(B,$B%;%V%s(B,$B%;%t%s(B]
							     [$B%d%D(B,$B%d(B,$B%O%A(B,$B%O(B,$B%P(B,$B%(!<%H(B]
								  [$B%3%3%N%D(B,$B%3(B,$B%-%e%&(B,$B%/(B,$B%J%$%s(B]
								       [$B%H%*(B,$B%8%e%&(B,$B%8(B,$B%F%s(B]]

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
