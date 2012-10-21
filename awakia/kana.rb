# coding: utf-8

def dic
  {
    'a' => '1',
    'b' => '2',
    'bc' => '3',
    'cd' => '4',
  }
end

def convert(input, output)
  #p "#{input},#{output}"
  if input.size == 0
    return output
  end
  dic.each do |k, v|
    if input.index(k) == 0
      ret = convert(input[k.size..-1], output + v)
      if ret != '$'
        return ret
      end
    end
  end
  return '$'
end

p convert('a', '')
p convert('b', '')
p convert('ab', '')
p convert('abc', '')
p convert('abcd', '')
