#!/usr/bin/env ruby -w
require "../lib/deepthought"

class DeepthoughtTest
	def initialize
	end
	def test(question)
		var = Deepthought.new
		raise RuntimeError, "Mauvais retour de \"Deepthought.new\" (#{var.class})" unless var.class == Deepthought
		raise RuntimeError, "Mauvaise valeur de retour (Mmmm i'm bored)" unless var.respond(question) == "42"
	end
end
