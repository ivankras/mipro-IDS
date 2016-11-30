class UsuariosController < ApplicationController
	def show
		#@usuario = Usuario.find(current_usuario.id)
		@usuario = current_usuario
	end

	def delete
		@usuario = current_usuario
	end

	def ranking
		@usuarios = Usuario.all
	end
end
