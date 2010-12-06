class Parser
  class << self
    def parse(string)
      current_char = string[0]
      counter = 0
      result = ''
      string.each_char {|c|
        counter +=1
        current_char == c && next
        result << (counter-1).to_s
        result << current_char
        current_char = c
        counter = 1
      }
      result << counter.to_s
      result << current_char
    end

    def generate(str, stage)
      counter = 0
      stage.times do
        str = parse(str)
        counter += 1
        yield str, counter if block_given?
      end
      str
    end
  end
end
