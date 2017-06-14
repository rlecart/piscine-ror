#!/usr/bin/ruby

def onsait
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
		oui = ARGV[0].split(/\s/).map(&:capitalize).join(' ')
		oui = oui.split(/,\s+/)
		oui.count.times do | i |
			if states[oui[i]]
				puts "#{capitals_cities[states[oui[i]]]} is the capital of #{oui[i]} (akr: #{states[oui[i]]})"
			elsif capitals_cities.key(oui[i])
				puts "#{oui[i]} is the capital of #{states.key(capitals_cities.key(oui[i]))} (akr: #{capitals_cities.key(oui[i])})"
			end
			i += 1
		end
	end
end

onsait
