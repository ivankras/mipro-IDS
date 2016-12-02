class Resena < ActiveRecord::Base
	belongs_to :favor
	validates :descripcion, length: {minimum: 1, maximum: 200}
end
