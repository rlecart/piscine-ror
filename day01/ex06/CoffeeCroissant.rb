#!/usr/bin/ruby

def ccc
	data = [['Frank'	,	 33],
			['Stacy'	,	 15],
			['Juan'		,	 24],
			['Dom'		,	 32],
			['Steve'	,	 24],
			['Jill'		,	 24]]
	data = data.sort_by{|x,y| [y, x]}
	data.count.times do | i |
		puts data[i][0]
		i += 1
	end
end

ccc
