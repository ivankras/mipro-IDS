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
		if ((params[:Año] == "2016") && (params[:Mes] != "Diciembre"))
			flash[:danger] = "La tarjeta ingresada se encuentra vencida."
			redirect_to(new_punto_compra_path) and return
		end
		if (params[:tarjeta]!="00000000000000") && (params[:tarjeta]!="11111111111111")
			if (params[:cantidad] != nil)
				dinero +=params[:cantidad].to_i
			end
			if (params[:InputPuntos] != nil)
				puntos +=params[:InputPuntos].to_i
			end
			res = (dinero / 12) + puntos
			current_usuario.puntos += res.to_i
			current_usuario.save
			flash[:success] = "La compra ha sido efectuada."
		elsif (params[:tarjeta]=="00000000000001")
			flash[:danger] = "La tarjeta ingresada es inválida."
		else
			flash[:danger] = "La tarjeta no dispone de fondos suficientes."
		end
		redirect_to(new_punto_compra_path)
	end

end
