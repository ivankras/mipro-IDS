class Comentario < ActiveRecord::Base
	belongs_to :favor
	belongs_to :usuario
end
