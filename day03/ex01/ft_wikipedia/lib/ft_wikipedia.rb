#!/usr/bin/env ruby -w
require "nokogiri"
require "open-uri"

class Ft_wikipedia
	def initialize(url)
		@url = url
	end
	def find
		page = Nokogiri::HTML(open(@url))
		next_url = page.css('p').css('a')[0]['href']
		find = 0
		tmp = page.css('p').css('a')
		tmp.each do | i |
			content = tmp[i].text if find == 0
			find = 1 if content == content.downcase
			i += 1
		end
		puts content
		puts next_url
	end
end

a = Ft_wikipedia.new(ARGV[0])
a.find
