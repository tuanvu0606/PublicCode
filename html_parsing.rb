#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
html_data = open('https://s3-ap-southeast-1.amazonaws.com/yoose-tmp/Banner_for_v4/TheCoffeeHouse_1/TheCoffeeHouse_creative_3.html').read
nokogiri_object = Nokogiri::HTML(html_data)
puts nokogiri_object
tagcloud_elements = nokogiri_object.xpath("//ul[@class='acid']/li/a")

tagcloud_elements.each do |tagcloud_element|
  puts tagcloud_element.text
end

f = File.new('out.html', 'w')
f.write(tagcloud_elements)
f.write("Hello Foo!\n")
f.close    
