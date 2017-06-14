#!/usr/bin/ruby

def bjr
	data = [['Caleb'	,	24],
			['Calixte'	,	84],
			['Calliste'	,	65],
			['Calvin'	,	12],
			['Cameron'	,	54],
			['Camil'	,	32],
			['Camille'	,	 5],
			['Can'		,	52],
			['Caner'	,	56],
			['Cantin'	,	 4],
			['Carl'		,	 1],
			['Carlito'	,	23],
			['Carlo'	,	19],
			['Carlos'	,	26],
			['Carter'	,	54],
			['Casey'	,	 2]]
	coucou = Hash[*data.flatten]
	data.count.times do | i |
		puts "#{coucou.key(data[i][1])} : #{coucou[data[i][0]]}"
		i +=1
	end
end

bjr
