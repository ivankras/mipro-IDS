class OfrecimientosController < ApplicationController
	
	def show
		if current_usuario != nil
			@ofrecimiento=Ofrecimiento.find(params[:id])
			@favor=Favor.find(params[:favor_id])
		else
			redirect_to(favors_path, alert: "Sección inaccesible")
		end
	end

	def new
		if current_usuario != nil
			@ofrecimiento = Ofrecimiento.new()
			@favor_id=params[:favor_id]
		else
			redirect_to(favors_path, alert: "Sección inaccesible")
		end
	end

	def create
		@ofrecimiento = Ofrecimiento.new(params.require(:ofrecimiento).permit(:descripcion, :fecha_limite, :favor_id))
		@ofrecimiento.usuario_id = current_usuario.id
		    if @ofrecimiento.save
		    	flash[:success] = "Te has ofrecido a realizar el favor."
		      	redirect_to(favor_path(params[:ofrecimiento][:favor_id]))
		    else
		    	flash[:alert] = "La fecha que has ingresado es inválida"
		    	redirect_to	:back
		    end
	end

	def destroy
		ofrecimiento=Ofrecimiento.find(params[:id])
		#Acá se borra físicamente el ofrecimiento
		ofrecimiento.destroy
		flash[:success] = "El ofrecimiento ha sido eliminado."
		redirect_to(favors_path)
	end

end
