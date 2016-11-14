class PuntocomprasController < ApplicationController

	def index
	end

	def show
		@puntocompra = Puntocompra.find(params[:id])
	end

	def new
		@puntocompra = Puntocompra.new(cantidad: 0)
	end

	def edit
	end

	def create
		@puntocompra = Puntocompra.new(params.require(:cantidad))
	end

	def update
	end

	def destroy
	end

end
