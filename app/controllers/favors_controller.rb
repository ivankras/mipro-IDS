class FavorsController < ApplicationController

	def index
		@favors = Favor.all
	end

	def show
		@favor = Favor.find(params[:id])
	end

	def new
		if isLogued? and hasPoints?
			@favor=Favor.new()
		else
			redirect_to(root_path, alert: "No tienes los suficientes puntos de logro para pedir un favor")
		end
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
