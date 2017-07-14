
class Comment

  attr_reader :author_name, :content
  def initialize(args)
      @author = args.fetch(:author_name, nil)
      @content = args.fetch(:content, nil)
    end


  def to_s
      puts "#{@content}"
      puts "      - #{@author_name}\n"
    end

end
