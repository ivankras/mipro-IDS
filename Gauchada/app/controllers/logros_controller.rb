class LogrosController < ApplicationController

	def index
		@logros = Logro.all
	end

	def show
	end

	def new
		@logro=Logro.new()
	end

	def edit
		@logro=Logro.find(params[:id])
	end

	def create
		b=params[:logro][:puntaje_min]
		c=params[:logro][:puntaje_max]
		d=true
		e=Logro.all
		e.each do |l|
			d &&= out_range?(l,b,c)
			break unless d
		end
		unless d
			#La idea es que si no está validado vuelva a pedir los datos
			redirect_to(new_logro_path, alert: "Error en el rango elegido. Redefina los limites.")
		else
			@logro=Logro.create(params.require(:logro).permit(:nombre, :puntaje_min, :puntaje_max))
			redirect_to(logros_path, success: "Un nuevo logro ha sido insertado")
		end
		# Falta enviar mensaje de confirmación
		# Iría un redirect_to, no sé a dónde
		# redirect_to logros_path, :notice => “Un nuevo logro ha sido insertado”;
	end

	def update
		a=params[:logro][:nombre]
		b=params[:logro][:puntaje_min]
		c=params[:logro][:puntaje_max]
		d=true
		e=Logro.all
		e.each do |l|
			d &&= out_range?(l,b,c)
			break unless d
		end
		unless d
			redirect_to(edit_logro_path(params[:id]), alert: "Error en el rango elegido. Redefina los limites.")
		else
			@logro=Logro.find(params[:id])
			@logro.nombre=a
			@logro.puntaje_min=b
			@logro.puntaje_max=c
			redirect_to(logros_path, success: "Un nuevo logro ha sido insertado")
		end
	end

	def destroy
		@logro=Logro.find(params[:id])
		#Acá se borra lógicamente el logro
		redirect_to(logro_path, method: :delete)
		redirect_to(logros_path, notice: "El logro #{@logro[:nombre]} ha sido borrado")
	end

	def out_range? (l,min, max)
		((min.to_i<l.puntaje_min)&&(max.to_i<l.puntaje_min))||(min.to_i>l.puntaje_max)&&(max.to_i>l.puntaje_max)
	end
end
