class FavorsController < ApplicationController

	def index
		if current_usuario != nil && !isAdmin?
			current_usuario.logro_id = enLogro(current_usuario.puntos)
			current_usuario.save
		end
		@favors = Favor.all
		if (params[:search] || params[:searchc])
		   @favors = Favor.search(params[:search], params[:searchc])
		end
	end

	def show
		@favor = Favor.find(params[:id])
		if ((current_usuario != nil) && (@favor.usuario_id == current_usuario.id))
			return
		else
			@favor.visitas += 1
			@favor.save
		end
	end

	def new
		if (current_usuario != nil) and hasPoints?
			@favor=Favor.new()
		else
			redirect_to(root_path, alert: "No tenés los suficientes puntos de logro para pedir un favor")
		end
	end

	def edit
		@favor = Favor.find(params[:id])
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
		      	redirect_to(new_favor_path, alert: "Error en el título (existente o muy largo)")
		    end
		else
			redirect_to(root_path, alert: "No tienes los suficientes puntos de logro para pedir un favor")
		end
	end

	def update
		id = params[:id]
	    ttl = params[:favor][:titulo]
		desc = params[:favor][:descripcion]
		ciu = params[:favor][:ciudad]
		foto = params[:favor][:foto_url]
	    @favor = Favor.find(id)
	    if @favor.update(titulo: ttl, descripcion: desc, ciudad: ciu, foto_url: foto)
	    	flash[:success] = "El favor '#{ttl}' ha sido editado correctamente"
	      	redirect_to(mis_favores_favors_path)
	    	#redirect_to(favors_path)
	    else
	     	redirect_to(edit_favor_path(@favor), alert: "Error en el título (existente o muy largo)")
	    end
	end

	def destroy
		favor = Favor.find(params[:id])
		#Acá se borra lógicamente el favor
		#favor.activo = false
		#favor.save
		#Acá se borra físicamente el favor
		Favor.destroy(params[:id])
		current_usuario.puntos += 1
    	current_usuario.save
    	current_usuario.logro_id = enLogro(current_usuario.puntos)
		current_usuario.save
		flash[:success] = "El favor ha sido eliminado"
		redirect_to(favors_path)
	end

	def mis_favores
		@favors = current_usuario.favors
	end

	
end
