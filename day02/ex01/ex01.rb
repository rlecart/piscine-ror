#!/usr/bin/env ruby -w

class Html
	attr_reader :page_name
	def initialize(page_name)
		@page_name = page_name
		head
		@o = File.open("#{@page_name}.html", "w+")
		@o.puts "<!DOCTYPE html>"
		@o.puts "<html>"
		@o.puts "<head>"
		@o.puts "<title>#{@page_name}</title>"
		@o.puts "</head>"
		@o.puts "<body>"
		@o.close
	end
	def head
		begin
			if File.file?("#{@page_name}.html")
				raise RuntimeError, "A file named #{@page_name}.html already exist!"
			end
		end
	end
	def dump(text)
		begin
			@o = File.open("#{@page_name}.html", "a+")
			s = @o.read.split("\n")
			if s.include? "<body>" 
				@o.puts "<p>#{text}</p>"
			else
				raise RuntimeError, "There is no body tag in #{@page_name}.html"
			end
			@o.close
		end
	end
	def finish
		begin
			@o = File.open("#{@page_name}.html", "a+")
			s = @o.read.split("\n")
			if s.include? "</body>"
				raise RuntimeError, "#{@page_name}.html has already been closed"
			else
				@o.puts "</body>"
			end
			@o.close
		end
	end
end
