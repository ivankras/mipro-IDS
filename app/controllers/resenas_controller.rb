class ResenasController < ApplicationController
  def new
    if current_usuario != nil
    	@usuario = Usuario.find(params[:usuario_id])
      @cumplido = params[:cumplio]
      @favor = Favor.find(params[:favor_id])
    	@resena = Resena.new()
    else
      redirect_to(new_usuario_session_path, alert: "Sección inaccesible")
    end
  end

  def create
  	@resena = Resena.new(params.require(:resena).permit(:descripcion, :cumplido, :favor_id))
    @favor = Favor.find(params[:resena][:favor_id])
    @favor.activo = false
    @favor.resena_id = @resena.id
    if @resena.save && @favor.save
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
