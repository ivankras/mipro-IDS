class Logro < ActiveRecord::Base
	has_many :usuarios
	validates :nombre, :format => {:with => /\A[a-zA-Z]+\z/, :message => "Sólo letras permitidas"}
	default_scope -> { order ("puntaje_max desc")}
end
