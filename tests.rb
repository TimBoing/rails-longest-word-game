# def word_included?(word, grid)
#   word.chars.each do |letter|
#     if grid.include? letter
#       grid.slice!(grid.index(letter))
#       p grid
#     else
#       return false
#     end
#   end
#   true
# end

# puts word_included?('JOHN', %w(J J Q P Q R H N))
require 'open-uri'
require 'json'

def is_english?
  uri_request = open("https://fr.wikipedia.org/wiki/Wagon").read
  #doc = JSON.parse(uri_request)
  return uri_request
end

puts is_english?
