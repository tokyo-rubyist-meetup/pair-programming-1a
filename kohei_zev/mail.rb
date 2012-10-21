#open("map.txt") do |f|
#  p f.read
#end
require "nkf"

def to_katakana(s)
  NKF.nkf("-w -h2", s)
end

# boot strap hash table
puts "trasform = Hash.new {|h,k| h[k] = [] }"
transform = IO.readlines("map.txt").inject({}) do |hash, line|
d=line.split
val = d.first.strip
keys = d[1..-1].map {|k| k.strip.split("、") }.flatten
keys.each do |k|
  puts "transform[\"#{to_katakana(k)}\"] = \"#{val}\""
end
end