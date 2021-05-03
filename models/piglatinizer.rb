require 'pry'
class PigLatinizer
  attr_reader :text, :output

  def initialize
    self.piglatinize(@text)
  end

  def piglatinize(text)
    @text = text
    string_hash = {}
    @string_array = @text.split
    @string_array.each_index do |i|
        element = @string_array[i]
        if element.end_with?(".")||element.end_with?(",")||element.end_with?("?")||element.end_with?(":")||element.end_with?("!")
            x = @string_array[i][-1]
            string_hash[@string_array.index(@string_array[i])] = x
            @string_array[i] = @string_array[i].delete!(x)
        end
    end
    self.begin_vowel
    self.begin_consonant
    string_hash.each_pair do |k,v|
        @string_array[k] = @string_array[k] + v
    end
    @output = @string_array.join(" ")
  end

  def begin_vowel
    @string_array.each_index do |i|
        if @string_array[i].start_with?(/a|e|i|o|u|A|E|I|O|U/)
            @string_array[i] = @string_array[i] + "way"
        end
    end
  end

  def begin_consonant
    @string_array.each_index do |i|
        if @string_array[i].start_with?(/b|c|d|f|g|j|k|l|m|n|p|q|s|t|v|x|z|h|r|w|y|B|C|D|F|G|J|K|L|M|N|P|Q|S|T|V|X|Z|H|R|W|Y/)
            #  @string_array[i].downcase!
            index = @string_array[i].index(/a|e|i|o|u|A|E|I|O|U/)
            index -= 1
            cons = @string_array[i][0..index]
            @string_array[i] = @string_array[i].delete_prefix(cons)
            @string_array[i] = @string_array[i] + cons + "ay"
        end
    end
  end


end
