class UsuariosController < ApplicationController
	def show
		@usuario = Usuario.find(params[:id])
		#@usuario = current_usuario
	end

	def delete
		@usuario = current_usuario
	end

	def ranking
		@usuarios = Usuario.all
	end
end
