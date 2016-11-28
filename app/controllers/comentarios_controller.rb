class ComentariosController < ApplicationController

	def index
		@comentarios = Comentario.all
	end

	def show
		@comentario = Comentario.find(params[:id])
	end

	def new
		if current_usuario != nil
			@comentario=Comentario.new()
			@favor_id=params[:favor_id]
		else
			redirect_to(new_usuario_session_path, warning: "Iniciá sesión para comentar un favor")
		end
	end

	def edit
		@comentario = Comentario.find(params[:id])
		@favor_id=params[:favor_id]
	end

	def create
		@comentario = Comentario.new(params.require(:comentario).permit(:descripcion, :favor_id))
		@comentario.usuario_id = current_usuario.id
		    if @comentario.save
		    	flash[:success] = "Has comentado el favor con éxito"
		      	redirect_to(favor_path(params[:comentario][:favor_id]))
		    else
		    	flash[:alert] = "La descripción es muy larga (200 caracteres)"
		    	redirect_to	:back
		    end
	end

	def update
		id = params[:id]
		resp = params[:comentario][:respuesta]
		@comentario = Comentario.find(id)
	    if @comentario.update(respuesta: resp)
	    	flash[:success] = "Respuesta efectuada correctamente"
	      	#redirect_to(mis_favores_favors_path)
	    	redirect_to(favor_path(params[:comentario][:favor_id]))
	    else
	     	redirect_to(edit_favor_path(@favor), alert: "La respuesta es muy larga (200 caracteres)")
	    end
	end

	def destroy
		comentario = Comentario.find(params[:id])
		#Acá se borra lógicamente el comentario
		#comentario.activo = false
		#comentario.save
		#Acá se borra físicamente el comentario
		f_id = comentario.favor_id
		Comentario.destroy(params[:id])
		flash[:success] = "El comentario ha sido eliminado"
		redirect_to(favor_path(f_id))
	end
end