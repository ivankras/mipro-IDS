class Logro < ActiveRecord::Base
	has_many :usuarios
	validates :nombre, :format => {:with => /\A[a-zA-Z]+\z/, :message => "Sólo letras permitidas"}
	default_scope -> { order ("puntaje_max desc")}
	validate :rango, :minimoMenorQueMaximo

	def rango
    	val = true
    	Logro.all.each do |logro|
      		if val && :id != logro.id && ((:puntaje_max>=logro.puntaje_min && :puntaje_max<=logro.puntaje_max)||(:puntaje_min>=logro.puntaje_min && :puntaje_min<=logro.puntaje_max))
        		val = false
      		end
      		break unless val
    	end
    	errors.add(:puntaje_min, "Rango incorrecto de valores para el logro.") unless val
    	return val
  	end

  	def minimoMenorQueMaximo
  		val= :puntaje_min < :puntaje_max
	    if val
	      errors.add(:puntaje_min, "Mínimo del logro mayor o igual que máximo; debe ser menor.")
	  	end
	  	val
    end
 end
