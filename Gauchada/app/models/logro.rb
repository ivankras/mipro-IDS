class Logro < ActiveRecord::Base
	has_many :usuarios
	default_scope -> { order ("puntaje_max desc")} 
	def out_range (min, max)
		return (((min<this.puntaje_min)&&(max<this.puntaje_max))||(min>this.puntaje_min)&&(max>this.puntaje_max))
	end
end
