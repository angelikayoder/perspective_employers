# The provided files will be loaded when this file executes.
# Require any additional files that have been created.
require_relative 'html_whitespace_cleaner'
require_relative 'post'
require_relative 'comment'
require_relative 'parser'
require 'open-uri'
require 'nokogiri'
require 'csv'

parser = Parser.new('html-samples/hacker-news-post.html')
new_post = parser.create_new_post_object
new_post.to_s

# if ARGV.any?
#   html_file = open(ARGV[0])
#   live_parser = HTMLParser.new(html_file)
#   new_post = live_parser.create_new_post_object
#   new_post.to_s
# end
