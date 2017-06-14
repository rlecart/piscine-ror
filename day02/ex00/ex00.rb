#!/usr/bin/env ruby -w

class Html
	attr_reader :page_name
	def initialize(page_name)
		@page_name = page_name
		@o = File.open("#{@page_name}.html", "w")
		@o.puts "<!DOCTYPE html>"
		@o.puts "<html>"
		@o.puts "<head>"
		@o.puts "<title>#{@page_name}</title>"
		@o.puts "</head>"
		@o.puts "<body>"
	end
	def dump(text)
		@o.puts "\t<p>#{text}</p>"
	end
	def finish
		@o.puts "</body>"
	end
end
