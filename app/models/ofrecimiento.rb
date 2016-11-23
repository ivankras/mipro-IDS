class Ofrecimiento < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :favor

	validate :valid_date

	def valid_date
    if fecha_limite
      errors.add(:fecha_limite, "inválida") if fecha_limite < Date.today 
    end
  end

end
