class PuntoComprasController < ApplicationController

	def index
	end

	def show
		@puntocompra = PuntoCompra.find(params[:id])
	end

	def new
		@puntocompra = PuntoCompra.new(cantidad: 0)
	end

	def edit
	end

	def create
		@puntocompra = PuntoCompra.new(params.require(:cantidad))
	end

	def update
	end

	def destroy
	end

end
