class Production::IniciosController < ApplicationController
	def index
	end

	def inicio_parameters
		params.require(:inicio).permit()
	end

end