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
		@favor = Favor.new(params.require(:favor).permit(:titulo, :descripcion, :ciudad, :foto_url))
	    if @favor.save
	    	current_usuario.puntos -= 1
	    	current_usuario.save
	    	flash[:success] = "Tu favor ha sido publicado"
	      	redirect_to(logros_path)
	    else
	      	redirect_to(new_logro_path, alert: "Error en el título (vacío o muy largo)")
	    end
	end

	def update
	end

	def destroy
	end

end
