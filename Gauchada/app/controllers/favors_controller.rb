class FavorsController < ApplicationController

	def index
		@favors = Favor.all
	end

	def show
		@favor = Favor.find(params[:id])
	end

	def new
		@favor=Favor.new()
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