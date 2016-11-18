class FavorsController < ApplicationController

	def index
		@favors = Favor.all
	end

	def show
		@favor = Favor.find(params[:id])
	end

	def new
		if (current_usuario != nil) and hasPoints?
			@favor=Favor.new()
		else
			redirect_to(root_path, alert: "No tienes los suficientes puntos de logro para pedir un favor")
		end
	end

	def edit
	end

	def create
		if hasPoints?
			@favor = Favor.new(params.require(:favor).permit(:titulo, :descripcion, :ciudad, :foto_url))
		    @favor.usuario_id = current_usuario.id
		    if @favor.save
		    	current_usuario.puntos -= 1
		    	current_usuario.save
		    	current_usuario.logro_id = enLogro(current_usuario.puntos)
				current_usuario.save
		    	flash[:success] = "Tu favor ha sido publicado"
		      	redirect_to(favors_path)
		    else
		      	redirect_to(new_favor_path, alert: "Error en el título (existente, vacío o muy largo)")
		    end
		else
			redirect_to(root_path, alert: "No tienes los suficientes puntos de logro para pedir un favor")
		end
	end

	def update
	end

	def destroy
	end

end
