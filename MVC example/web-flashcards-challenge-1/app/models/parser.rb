class Parser
  attr_reader :questions, :answers
  def initialize(filename)
    @filename = filename
    @questions = []
    @answers = []
  end
  def parse
    line = 0
    File.open(@filename, "r").each do |row|
      case line
        when 0
          @questions << row.gsub(/\n/,"")
          line += 1
        when 1
          @answers << row.gsub(/\n/,"")
          line += 1
        when 2
          line = 0
      end
    end
  end
end
