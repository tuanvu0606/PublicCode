#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
html_data = open('/var/lib/jenkins/workspace/AWS_flashing_creatives_pipeline/TheCoffeeHouse_creative_300x250_v1.html').read
nokogiri_object = Nokogiri::HTML(html_data)
tagcloud_elements = nokogiri_object.xpath("//ul[@class='tagcloud']/li/a")

tagcloud_elements.each do |tagcloud_element|
  puts tagcloud_element.text
end

f = File.new('out.html', 'w')
f.write(tagcloud_elements)
f.write("Hello Foo!\n")
f.close    
