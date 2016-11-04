class Logro < ActiveRecord::Base
	has_many :usuarios
	default_scope -> { order ("puntaje_max desc")} 
	def out_range (min, max)
		((min<this.puntaje_min)&&(max<this.puntaje_max))||(min>this.puntaje_min)&&(max>this.puntaje_max)
	end
	def self.verificar_rangos(min, max)
		a=true
		Logro.each do |l|
			a &&= l.out_range(min,max)
			break unless a
		end
		a
	end
	def self.modificar_datos(nombre, min, max)
		this.nombre=nombre
		this.min=min
		this.max=max
	end
end
