#!/usr/bin/ruby

def opercule
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
		if states[ARGV[0]]
			puts "#{capitals_cities[states[ARGV[0]]]}"
		else
			puts "Unknown state"
		end
	end
end

opercule
