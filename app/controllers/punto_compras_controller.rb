class PuntoComprasController < ApplicationController

	skip_before_filter :verify_authenticity_token 

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

	def agregarpuntos
		dinero =params[:Cantidad]
		puntos =params[:InputPuntos]
		res = (dinero/12) + puntos
		current_usuario.puntos += res
		current_usuario.save
	end

end
