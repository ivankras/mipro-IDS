class ResenasController < ApplicationController
  def new
    if current_usuario != nil
    	@usuario = params[:usuario]
      @cumplido = params[:cumplio]
      @favor = params[:favor]
    	@resena = Resena.new()
    else
      redirect_to(new_usuario_session_path, alert: "Sección inaccesible")
    end
  end

  def create
  	@resena = Resena.new(params.require(:resena).permit(:descripcion, :cumplido, :favor_id))
    if @resena.save
      flash[:success] = "Reseña exitosa"
      redirect_to(favor_path(params[:resena][:favor_id]))
    else
      flash[:alert] = "La descripción es muy larga (200 caracteres)"
      redirect_to :back
    end
  end

  def show
  	@resena = Resena.find(params[:id])
  end

  def edit
  	@resena = Resena.find(params[:id])
  end

  def destroy

  end

end
