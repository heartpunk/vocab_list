require './vocab_list'
require 'pp'

pp VocabList.new(ARGF.read.split(/\s/).reject(&:empty?)).sorted_list