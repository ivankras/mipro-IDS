class Favor < ActiveRecord::Base
	has_one :usuario
	has_one :resena
	has_many :comentario
	validates :nombre, length: {minimum: 1, maximum: 20}
	default_scope -> { order ("created_at desc")} 
	scope :recientes,-> { order ("created_at desc").limit(5) }
end
