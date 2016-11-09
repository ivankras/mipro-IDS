class Logro < ActiveRecord::Base
	has_many :usuarios
	validates :nombre, format: {:with => /\A[a-zA-Z]+\z/, :message => "Sólo letras permitidas"}
  validates :nombre, length: {minimum: 1, maximum: 20}
	default_scope -> { order ("puntaje_max desc")}
	validate :rango, :minimoMenorQueMaximo

	def rango
    	val = true
    	Logro.all.each do |logro|
          if val && self.id != logro.id && (self.puntaje_max.between?(logro.puntaje_min,logro.puntaje_max)||(self.puntaje_min.between?(logro.puntaje_min,logro.puntaje_max))
      		#if val && self.id != logro.id && ((self.puntaje_max>=logro.puntaje_min && self.puntaje_max<=logro.puntaje_max)||(self.puntaje_min>=logro.puntaje_min && self.puntaje_min<=logro.puntaje_max))
        		val = false
      		end
      		break unless val
    	end
    	errors.add(self.puntaje_min, "Rango incorrecto de valores para el logro.") unless val
    	return val
  	end

  	def minimoMenorQueMaximo
  		val= self.puntaje_min < self.puntaje_max
	    if val
	      errors.add(:puntaje_min, "Mínimo del logro mayor o igual que máximo; debe ser menor.")
	  	end
	  	return val
    end
 end
