
class Post

  attr_accessor :title, :url, :points, :author_name, :item_id

  def initialize(args)
    @title = args.fetch(:title, nil)
    @url = args.fetch(:url, nil)
    @points = args.fetch(:points, nil)
    @author_name = args.fetch(:author_name, nil)
    @item_id = args.fetch(:item_id, nil)
    @comments = args.fetch(:comments, [])
  end

  def comments() #returns the post's collection of comments.
    @comments
  end

  def add_comment(comment_object) #add_comment: takes a Comment object as its input and adds it to the post's collection of comments. This only affects a post object in our Ruby program, it doesn't do anything to the Hacker News page.
    @comments << comment_object
  end

  def to_s
    puts "#{title} (Hacker News ID: #{@item_id})"
    puts "URL: #{url}"
    puts "Author: #{author_name}"
    puts "Points: #{points}\n\n"
    @comments.each {|comment| comment.to_s}
  end

end
