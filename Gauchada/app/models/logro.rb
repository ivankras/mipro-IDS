class Logro < ActiveRecord::Base
	has_many :usuarios
	default_scope -> { order("puntaje_max desc")}
end
