class Logro < ActiveRecord::Base
	has_many :usuarios
	validates :nombre, format: {:with => /\A[a-zA-Z]+\z/, :message => "Sólo letras permitidas"}
  validates :nombre, length: {minimum: 1, maximum: 20}
	default_scope -> { order ("puntaje_max desc")}
	validate :rango, :minimoMenorQueMaximo

	def rango
    	val = true
    	Logro.all.each do |logro|
        if logro.activo
          #pert = (id != logro.id) && (puntaje_max.between?(logro.puntaje_min,logro.puntaje_max)||puntaje_min.between?(logro.puntaje_min,logro.puntaje_max))
      		#pert = ((puntaje_max>=logro.puntaje_min && puntaje_max<=logro.puntaje_max)||(puntaje_min>=logro.puntaje_min && puntaje_min<=logro.puntaje_max))
          if (id != logro.id)
            pert = (entre(puntaje_min,logro.puntaje_min,logro.puntaje_max)||entre(puntaje_max,logro.puntaje_min,logro.puntaje_max));
          	val = !pert
      		end
        end
      	break unless val    	   
      end
    	errors.add(:puntaje_min, "Rango incorrecto de valores para el logro.") unless val
    	return val
  	end

  	def minimoMenorQueMaximo
  		val = puntaje_min < puntaje_max
	    unless val
	      errors.add(:puntaje_min, "Mínimo del logro mayor o igual que máximo; debe ser menor.")
	  	end
	  	return val
    end

    private

    def entre(o,min,max)
      return (o>=min) && (o<=max)
    end
 end
