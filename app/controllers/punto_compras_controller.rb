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

	def reporte
		@puntocompras = PuntoCompra.all
		@puntocompras = PuntoCompra.filter(params[:dsd], params[:hst])
		if (params[:hst] && params[:dsd]) 
			if (params[:hst] < params[:dsd])
				flash.now[:warning] = "El rango seleccionado es incorrecto."
				return
			end
		end 
		if (params[:dsd] || params[:hst])
		   if ((params[:dsd] && params[:hst]) && (params[:dsd] == params[:hst]))
		   	flash.now[:success] = "Se muestran las compras efectuadas el día " + localize(params[:dsd].to_date, :format => :long) + "."
		   else
		   	flash.now[:success] = "Se muestran las compras efectuadas desde el " + localize(params[:dsd].to_date, :format => :long) + " hasta el " + localize(params[:hst].to_date, :format => :long) + "."
		   end	
		end
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
			precio_total = dinero + (puntos * 12)
			res = (dinero / 12) + puntos
			current_usuario.puntos += res.to_i
			current_usuario.save
			current_usuario.logro_id = enLogro(current_usuario.puntos)
			current_usuario.save
			@puntocompra = PuntoCompra.new(cantidad: res, precio_total: dinero)
			@puntocompra.usuario_id = current_usuario.id
			@puntocompra.save
			flash[:success] = "La compra ha sido efectuada."
		elsif (params[:tarjeta]=="00000000000001")
			flash[:danger] = "La tarjeta ingresada es inválida."
		else
			flash[:danger] = "La tarjeta no dispone de fondos suficientes."
		end
		redirect_to(new_punto_compra_path)
	end

end
