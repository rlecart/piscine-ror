#!/usr/bin/ruby

def obstacle
	states = {
		"Oregon" => "OR",
		"Alabama" => "AL",
		"New Jersey" => "NJ",
		"Colorado" => "CO"
	}
	capitals_cities = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}
	if ARGV.count == 1
		if capitals_cities.key(ARGV[0])
			puts "#{states.key(capitals_cities.key(ARGV[0]))}"
		else
			puts "Unknown capital city"
		end
	end
end

obstacle
