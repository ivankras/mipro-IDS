class PuntoCompra < ActiveRecord::Base
	self.table_name = "punto_compras"
	belongs_to :usuario
	def self.filter(dsd, hst)
  		where("created_at BETWEEN ? AND ?", "%#{dsd} 00:00:00%", "%#{hst} 23:59:59%")
	end
end

