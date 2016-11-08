module SesionHelper
	def sign_in_out_button
		if current_usuario
			link_to "Cerrar Sesión", destroy_usuario_session_path, method: :delete
		else
			link_to "Iniciar Sesión", new_usuario_session_path
		end
	end
end
