#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
PAGE_URL = 'https://s3-ap-southeast-1.amazonaws.com/yoose-tmp/Banner_for_v4/TheCoffeeHouse_1/TheCoffeeHouse_creative_3.html'
page = Nokogiri::HTML(open(PAGE_URL))
   
puts page.css("div")

output = page.css("div").to_s

f = File.new('out.html', 'w')
f.write()
f.write("Hello Foo!\n")
f.close    
