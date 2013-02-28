# ruby find-image-in-xib.rb ../code/iphone/SettingsView.xib adv_btn.png
require 'nokogiri'

xib_name = ARGV[0]
image_name = ARGV[1]

xib = Nokogiri::XML(open(xib_name, 'r'))

nodes = xib.xpath("//object[.//string[@key='NSResourceName' and text() = '#{image_name}']]/string[@key='NSFrame']/text()")

puts nodes[0]
    .text
    .gsub(/({|})/, '')
    .split(',')
    .slice(2, 2)
    .collect{ |i| i.to_i }
    .join(', ') unless nodes[0].nil?
