require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    word = params['word'].upcase
    grid_array = params['grid_array'].split
    @score = 0
    if word_included?(word, grid_array)
      if is_english?(word)
        @result = "Congrats man! The word \'#{word}\' is valid!"
        @score = word.length
        session[:total_score] = 0 if session[:total_score].nil?
        session[:total_score] += @score

      else
        @result = "Sorry bro! The word \'#{word}\' is not english!"
      end
    else
      @result = "WTF?! The word \'#{word}\' is not even in the grid!"
    end
    @total_score = session[:total_score]
  end

  private

  def word_included?(word, grid)
    word.chars.each do |letter|
      if grid.include? letter
        grid.slice!(grid.index(letter))
        p grid
      else
        return false
      end
    end
    true
  end

  def is_english?(word)
    uri_request = open("https://wagon-dictionary.herokuapp.com/#{word}").read
    doc = JSON.parse(uri_request)
    doc['found']
  end


end

