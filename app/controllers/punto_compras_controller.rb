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
		puntos = 0
		dinero = 0
		if (params[:cantidad] != nil)
			dinero +=params[:cantidad].to_i
		end
		if (params[:InputPuntos] != nil)
			puntos +=params[:InputPuntos].to_i
		end
		res = (dinero / 12) + puntos
		current_usuario.puntos += res.to_i
		current_usuario.save
		redirect_to(new_punto_compra_path)
	end

end
