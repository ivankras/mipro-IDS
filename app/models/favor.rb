class Favor < ActiveRecord::Base
	has_one :usuario
	has_one :resena
	has_many :comentario
	validates :titulo, length: {minimum: 1, maximum: 20}
	validates :titulo, uniqueness: true
	default_scope -> { order ("created_at desc")} 
	scope :recientes,-> { order ("created_at desc").limit(5) }
end
