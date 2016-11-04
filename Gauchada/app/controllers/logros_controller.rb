class LogrosController < ApplicationController
	def new
		@logro=Logro.new()
	end
	def edit
		
	end
	def create
		@logro=Logro.create(params.require(:logro).permit(:nombre, :puntaje_min, :puntaje_max))
		a=true;
		b=@logro.puntaje_min;
		c=@logro.puntaje_max;
		Logro.each do |l|
			a=a&&l.out_range(b,c)
			if (!a)
				break
			end
		end
		if (!a)
			#No me cierra ni un poquito. La idea es que si no está validado vuelva a pedir los datos
			redirect_to @logro.create, :notice => “Un nuevo logro ha sido insertado”;
		else
			redirect_to logros_path, :notice => “Un nuevo logro ha sido insertado”;
		end
		# Falta enviar mensaje de confirmación
		# Iría un redirect_to, no sé a dónde
		# redirect_to logros_path, :notice => “Un nuevo logro ha sido insertado”;
	end
	def update
	end
	def destroy
	end
	def index
		
	end
	def show
		
	end
end
