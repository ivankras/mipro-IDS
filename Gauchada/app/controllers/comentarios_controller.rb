class ComentariosController < ApplicationController

	def index
		@comentarios = Comentario.all
	end

	def show
		@comentario = Comentario.find(params[:id])
	end

	def news
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

end