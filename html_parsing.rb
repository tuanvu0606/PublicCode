#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
html_data = open('http://web.archive.org/web/20090220003702/http://www.sitepoint.com/').read
nokogiri_object = Nokogiri::HTML(html_data)
tagcloud_elements = nokogiri_object.xpath("//ul[@class='tagcloud']/li/a")

tagcloud_elements.each do |tagcloud_element|
  puts tagcloud_element.text
end

f = File.new('out.txt', 'w')
f.write("Hello World!\n")
f.write("Hello Foo!\n")
f.close    
