#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def print_title(title)
  puts '#######################################'
  puts title
  puts '#######################################'
end

def print_content(content)
  puts content
  puts
  puts
end

LINKY = {"Portus" => 'http://www.portus.sk/lang/sk/restauracia/'}


RESTAURACIE = ['http://www.obedovat.sk/bratislava/Restauracia_7172_Beer_Palace',
               'http://www.obedovat.sk/bratislava/Restauracia_344_Dubliner_Irish_pub',
               'http://www.obedovat.sk/bratislava/Restauracia_295_Hacienda_Mexicana',
               'http://www.obedovat.sk/bratislava/Restauracia_6990_All_stars_cafe',
               'http://www.obedovat.sk/bratislava/Restauracia_7218_Sladov%C5%88a_-_House_of_Beer',
               'http://www.obedovat.sk/bratislava/Restauracia_56_Pra%C5%A1n%C3%A1_Ba%C5%A1ta'
]

LINKY.each do
  |nazov, linka|
  print_title(nazov)
  print_content(linka)
end

RESTAURACIE.each do
  |rest|
  doc = Nokogiri::HTML(open(rest))
  nazov = doc.css('h1.h2homenews01c').map{|e| e.content}.join(',')
  print_title(nazov)
  print_content(doc.css('.texthelp')[2].content)
end
