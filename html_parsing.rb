#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
PAGE_URL = 'https://s3-ap-southeast-1.amazonaws.com/yoose-tmp/Banner_for_v4/TheCoffeeHouse_1/TheCoffeeHouse_creative_3+-+Copy.html'
page = Nokogiri::HTML(open(PAGE_URL))

h1  = page.at_css "h1"

h1.content = "Snap, Crackle & Pop"

puts page.css("div")

output = page.css("div").to_s

f = File.new('out.html', 'w')
f.write(page.to_html)
f.close    
