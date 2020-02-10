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

def is_english?(word)
  uri_request = open("https://wagon-dictionary.herokuapp.com/#{word}").read
  doc = JSON.parse(uri_request)
  return doc["found"].class
end

puts is_english?("test")
