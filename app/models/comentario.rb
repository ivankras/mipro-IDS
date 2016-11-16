class Comentario < ActiveRecord::Base
	belongs_to :favor
	belongs_to :usuario
	validates :descripcion, length: {minimum: 1, maximum: 200}
	validates :respuesta, length: {maximum: 200}
end
