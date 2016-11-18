 class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :isAdmin?
  helper_method :isThisAdmin?
  helper_method :isLogged?
  helper_method :howManyPoints?
  helper_method :enLogro

  # Determina si el usuario actual es administrador del sitio.
  def isAdmin?
    return current_usuario != nil && current_usuario.admin
  end

  def isThisAdmin?(id)
    usrp = Usuario.find(id)
    return usrp != nil && usrp.admin
  end

  def isLogged?
    return current_usuario != nil
  end

    #Determina si el usuario tiene la cantidad de puntos necesaria para pedir un favor
  def hasPoints?(cant= 1)
    return current_usuario.puntos.to_i >= cant.to_i
  end

  def howManyPoints?
    return current_usuario.puntos.to_i
  end

  def printErrors(object)
    object.errors.each do |attribute, msg|
      flash[:alert] = msg;
    end
  end

  def enLogro(puntaje)
    id = 8000
    pert = false
    Logro.where(activo: true).each do |logro|
          lmin = logro.puntaje_min
          lmax = logro.puntaje_max
          pert = (puntaje >= lmin) && (puntaje <= lmax)
          if pert
            id = logro.id
            break
          end   
      end
      if !pert
        if defined? Logro.find(id)
          Logro.create(id: id, nombre: "Usuarios sin logro", puntaje_min: -8000, puntaje_max: -7999, activo: false)
        end
      end
      return id
  end
  #current_usuario.logro_id =enLogro(current_usuario.puntos)

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)do |usuario_params|
    	usuario_params.permit(:nombre, :apellido, :fecha_nacimiento, :telefono, :sexo, :email, :password)
  	end
  end
end
