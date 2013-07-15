require 'set'

class VocabList
  attr_accessor :sorted_list, :words

  def initialize(list)
    self.sorted_list = []
    self.words = Set.new
    list.each {|word| add_word word}
  end

  def add_word word
    unless words.include? word
      words.add word
      sorted_list << word
    end
  end

  def to_str
    sorted_list.to_str
  end
end