#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
PAGE_URL = ARGV[0].to_s
page = Nokogiri::HTML(open(PAGE_URL))

h1  = page.at_css "h1"

#h1.content = "Snap, Crackle & Pop"

puts PAGE_URL

output = page.css("div").to_s

f = File.new('out.html', 'w')
f.write(page.to_html)
f.close    

ARGV.each do|a|
  puts "Argument: #{a}"
end
