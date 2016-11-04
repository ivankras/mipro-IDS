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
		@logro=Logro.find(params[:id]) #¿De dónde sacaría el id?
	end

	def create
		a=true
		b=params[:logro][:puntaje_min]
		c=params[:logro][:puntaje_max]
		Logro.each do |l|
			a &&= l.out_range(b,c)
			break unless a
		end
		unless a
			@logro=Logro.create(params.require(:logro).permit(:nombre, :puntaje_min, :puntaje_max))
			#La idea es que si no está validado vuelva a pedir los datos
			redirect_to(new_logro_path, notice: "Un nuevo logro ha sido insertado")
		else
			redirect_to(logros_path, notice: "Un nuevo logro ha sido insertado")
		end
		# Falta enviar mensaje de confirmación
		# Iría un redirect_to, no sé a dónde
		# redirect_to logros_path, :notice => “Un nuevo logro ha sido insertado”;
	end

	def update
	end

	def destroy
	end

end
