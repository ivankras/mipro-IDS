class Favor < ActiveRecord::Base
	belongs_to :usuario
	has_one :resena
	has_many :ofrecimientos, dependent: :destroy
	has_many :comentarios, dependent: :destroy
	validates :titulo, length: {minimum: 1, maximum: 50}
	validates :titulo, uniqueness: true
	default_scope -> {order ("created_at desc")} 
	scope :mostv,-> {reorder ("visitas desc")}
	scope :lessv,-> {reorder ("visitas asc")}
	#scope :recientes,-> { order ("created_at desc").limit(5) }
	def self.search(search, searchc)
  		where("titulo ILIKE ? AND ciudad ILIKE ?", "%#{search}%", "%#{searchc}%")
	end
end
