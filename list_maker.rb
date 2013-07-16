require './vocab_list'
require 'set'

PUNCTUATION = "[\.,':;?!-]"

known_words_path = "/Users/tehgeekmeister/.known_words"
known_words_list = File.file?(known_words_path) ? open(known_words_path).read.lines.map(&:strip) : []
known_words = Set.new known_words_list

def remove_byte_order_markers str
	str.gsub("\xEF\xBB\xBF".force_encoding("UTF-8"), '')
end

def remove_leading_or_trailing_punctuation str
  str.gsub(/\A#{PUNCTUATION}*/, '').gsub(/#{PUNCTUATION}*\z/, '')
end

text = ARGF.read
text = remove_byte_order_markers text
text = text.split(/\s|--/).map(&:strip).map(&:downcase).map {|w| remove_leading_or_trailing_punctuation w}.reject(&:empty?)

puts VocabList.new(text, known_words).output
