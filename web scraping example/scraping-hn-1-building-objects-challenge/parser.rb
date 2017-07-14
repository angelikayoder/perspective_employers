require_relative 'post'
require_relative 'comment'
require 'nokogiri'
require_relative 'html_whitespace_cleaner'

class Parser

  def initialize(file)
    @file = file
  end

  def parse_title
    doc = parse
    title = doc.css('.title a').first.text
  end

  def parse_authors
    doc = parse
    body_node = doc.children.last
    links = body_node.css('a')
    hrefs = links.map {|link| link.attribute('href').to_s }
    authors = hrefs.select {|href| href =~ /user\?id/ }
  end

  def parse_comments
    doc = parse
    body_node = doc.children.last
    comms = body_node.css('.c00').text
    comments = comms.split('-----')
  end

  def parse_points
    doc = parse
    body_node = doc.children.last
    points = body_node.css('.score').text.split(" ")[0].to_i
  end

  def parse_url
    doc = parse
    url = doc.css('.title a').first.attribute('href').to_s
  end

  def parse_id
    doc = parse
    body_node = doc.children.last
    points = body_node.css('.athing a')[0].attribute('id').to_s[3..-1].to_i
  end

  def create_comment_objects
    authors = parse_authors
    comment_array = parse_comments
    comments = []
    comment_array.each_with_index do |comment, index|
      comments << Comment.new({:author => "#{authors[index+1][8..-1]}", :content => comment})
    end
    comments
  end

  def create_new_post_object
    title = parse_title
    url = parse_url
    points = parse_points
    author = parse_authors[0][8..-1]
    item_id = parse_id
    comments = create_comment_objects
    new_post = Post.new({:title => title, :url => url, :points => points, :username => author, :item_id => item_id, :comments => comments})
    new_post
  end



  def parse

    html = File.read(@file)
    clean_html = HTMLWhitespaceCleaner.clean(html)
    nokogiri_document = Nokogiri.parse(clean_html)
    html_node = nokogiri_document.children.last
  end


end
