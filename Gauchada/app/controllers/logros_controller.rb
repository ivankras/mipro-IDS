class LogrosController < ApplicationController

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
			@logro=Logro.new()
		else
			redirect_to(root_path, alert: "Sección inaccesible")
		end
	end

	def edit
		if isAdmin?
			@logro=Logro.find(params[:id])
		else
			redirect_to(root_path, alert: "Sección inaccesible")
		end
	end

	def create
		@logro = Logro.new(params.require(:logro).permit(:nombre, :puntaje_min, :puntaje_max))
	    if @logro.save
	      redirect_to(logros_path, success: "Un nuevo logro ha sido insertado")
	    else
	      redirect_to(new_logro_path, alert: "Error en el rango elegido. Redefina los limites.")
	    end


		####INTENTO DE CODIFICACIÓN
		#####VALIDACIÓN
		#b=params[:logro][:puntaje_min]
		#c=params[:logro][:puntaje_max]
		#d=true
		#e=Logro.all
		#.each do |l|
		#	d &&= out_range?(l,b,c)
		#	break unless d
		#end
		#unless d
			#La idea es que si no está validado vuelva a pedir los datos
		#	redirect_to(new_logro_path, alert: "Error en el rango elegido. Redefina los limites.")
		#else
		#	@logro=Logro.create(params.require(:logro).permit(:nombre, :puntaje_min, :puntaje_max))
		#	redirect_to(logros_path, success: "Un nuevo logro ha sido insertado")
		#end
		# Falta enviar mensaje de confirmación
	end

	def update
		id = params[:id]
	    nom=params[:logro][:nombre]
		min=params[:logro][:puntaje_min].to_i
		max=params[:logro][:puntaje_max].to_i
	    @logro = Logro.find(id)
	    if @logro.update(nombre: nom, puntaje_min: min, puntaje_max: max)
	      redirect_to(logros_path, success: "El logro #{nom} ha sido editado correctamente")
	    else
	      redirect_to(edit_logro_path(logro), alert: "Error en el rango elegido. Redefina los limites.")
	    end


		####INTENTO DE CODIFICACIÓN
		#####VALIDACIÓN
		#a=params[:logro][:nombre]
		#b=params[:logro][:puntaje_min]
		#c=params[:logro][:puntaje_max]
		#d=true
		#e=Logro.all
		#e.each do |l|
		#	d &&= out_range?(l,b,c)
		#	break unless d
		#end
		#unless d
		#	redirect_to(edit_logro_path(params[:id]), alert: "Error en el rango elegido. Redefina los limites.")
		#else
		#	@logro=Logro.find(params[:id])
		#	@logro.update(nombre: a, puntaje_min: b, puntaje_max: c)
		#	redirect_to(logros_path, success: "Un nuevo logro ha sido insertado")
			# Falta enviar mensaje de confirmación
		#end
	end

	def destroy
		@logro = Logro.find(params[:id])
		nom=params[:logro][:nombre]
		#Acá se borra lógicamente el logro
		@logro.activo=false
		#Acá se borra físicamente el logro
		#Logro.destroy(params[:id])
		redirect_to(logros_path, notice: "El logro #{nom} ha sido borrado")
		# Falta enviar mensaje de confirmación
	end
end
