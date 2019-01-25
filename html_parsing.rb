#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

   
#PAGE_URL = ARGV[0].to_s

#IMG_URL = ARGV[1].to_s 

PAGE_URL = "https://s3-ap-southeast-1.amazonaws.com/yoose-tmp/Banner_for_v4/TheCoffeeHouse_1/TheCoffeeHouse_creative_4.html"

IMG_URL = "https://s3-ap-southeast-1.amazonaws.com/yoose-tmp/Banner_for_v4/TheCoffeeHouse_1/BANNER-web-300x250.jpg"

#get the page, parse it
page = Nokogiri::HTML(open(PAGE_URL))

#get the image tag img
img  = page.css('img')

#get the color of from_to class span
from_to_spans = page.css('script')

#puts from_to_spans

from_to_spans.each{|link| puts link['style'] }

#puts css

#puts img[0]["src"]
img[0]["src"] = IMG_URL

#output = page.css("div").to_s

f = File.new('out.html', 'w')
f.write(page.to_html)
f.close    

ARGV.each do|a|
  puts "Argument: #{a}"
end




