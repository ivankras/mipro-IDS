class FavorsController < ApplicationController

	def index
		@favors = Favor.all
	end

	def show
		@favor = Favor.find(params[:id])
	end

	def new
		if isAdmin?
			@favor=Favor.new()
		else
			redirect_to(root_path, alert: "Sección inaccesible")
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
