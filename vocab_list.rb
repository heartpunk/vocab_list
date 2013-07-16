require 'set'

class VocabList
  attr_accessor :sorted_list, :words, :known_words

  def initialize(list, known_words = Set.new)
    self.sorted_list = []
    self.words = Set.new
    self.known_words = known_words
    list.each {|word| add_word word}
  end

  def add_word word
    return if words.include?(word) or known_words.include?(word)
    words.add word
    sorted_list << word
  end

  def output
    sorted_list.map {|word| word + "\n"}.join('')
  end
end
