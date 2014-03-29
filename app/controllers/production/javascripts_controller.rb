class Production::JavascriptsController < ApplicationController
	def dynamic_states
		@states = Sectore.find(:all)
	end
end
