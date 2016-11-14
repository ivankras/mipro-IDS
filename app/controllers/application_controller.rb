 class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :isAdmin?

  # Determina si el usuario actual es administrador del sitio.
  def isAdmin?
    return current_usuario != nil && current_usuario.admin
  end

  def isThisAdmin?(id)
    usrp = Usuario.find(id)
    return usrp != nil && usrp.admin
  end

  # Determina si el usuario esta logueado en el sitio. Si se envia el id,
  # determina si el usuario se ha logueado con el id especificado.
  def isLogued?(id= current_usuario.id)
    return current_usuario != nil && current_usuario.id.to_i == id.to_i
  end

  #Determina si el usuario tiene la cantidad de puntos necesaria para pedir un favor
  def hasPoints?(cant= 1)
    return current_usuario.puntos.to_i >= cant.to_i
  end

  def printErrors(object)
    object.errors.each do |attribute, msg|
      flash[:alert] = msg;
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)do |usuario_params|
    	usuario_params.permit(:nombre, :apellido, :fecha_nacimiento, :telefono, :sexo, :email, :password)
  	end
  end
end
