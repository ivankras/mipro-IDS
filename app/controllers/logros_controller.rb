class LogrosController < ApplicationController

	helper_method :enLogro?

	def index
		if isAdmin?
			@logros = Logro.all
		else
			redirect_to(root_path, alert: "Sección inaccesible")
		end
	end

	def show
	end

	def new
		if isAdmin?
			@logro = Logro.new()
		else
			redirect_to(root_path, alert: "Sección inaccesible")
		end
	end

	def edit
		if isAdmin?
			@logro = Logro.find(params[:id])
		else
			redirect_to(root_path, alert: "Sección inaccesible")
		end
	end

	def create
		@logro = Logro.new(params.require(:logro).permit(:nombre, :puntaje_min, :puntaje_max))
	    if @logro.save
	    	flash[:success] = "Un nuevo logro ha sido insertado"
	      	redirect_to(logros_path)
	    else
	      	redirect_to(new_logro_path, alert: "Error en el nombre o en el rango elegido.")
	    end

	end

	def update
		id = params[:id]
	    nom = params[:logro][:nombre]
		min = params[:logro][:puntaje_min].to_i
		max = params[:logro][:puntaje_max].to_i
	    @logro = Logro.find(id)
	    if @logro.update(nombre: nom, puntaje_min: min, puntaje_max: max)
	    	flash[:success] = "El logro #{nom} ha sido editado correctamente"
	      	redirect_to(logros_path)
	    else
	     	redirect_to(edit_logro_path(@logro), alert: "Error en el nombre (sólo letras) o en el rango elegido.")
	    end
	end

	def destroy
		logro = Logro.find(params[:id])
		#Acá se borra lógicamente el logro
		logro.activo = false
		logro.save
		#Acá se borra físicamente el logro
		#Logro.destroy(params[:id])
		flash[:success] = "El logro ha sido borrado"
		redirect_to(logros_path)
		# Falta enviar mensaje de confirmación
	end

	def enLogro(puntaje)
		id = 8000
		pert = false
		Logro.where(activo: true).each do |logro|
	        lmin = logro.puntaje_min
	        lmax = logro.puntaje_max
	        pert = (puntaje >= lmin) && (puntaje <= lmax)
	        if pert
	        	id = logro.id
	        	break
	        end   
	    end
	    if !pert
	    	if Logro.find(id) == nil
	    		Logro.create(id: id, nombre: "Usuarios sin logro", puntaje_min: -8000, puntaje_max: -7999, activo: false)
	    	end
	    end
	    return id
	end
	#current_usuario.logro_id =enLogro(current_usuario.puntos)
end
