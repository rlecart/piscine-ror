#!/usr/bin/ruby

def croissant
	o = File.open("numbers.txt", "r")
	lines = File.foreach("numbers.txt").count
	oui = o.read.split(/,\n/)
	oui = oui.sort_by(&:to_i)
	lines.times do | i |
		puts oui[i]
		i += 1
	end
	o.close
end

croissant
