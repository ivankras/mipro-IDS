class PuntoCompra < ActiveRecord::Base
	self.table_name = "punto_compras"
	has_one :usuario
end
