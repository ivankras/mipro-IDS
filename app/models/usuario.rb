class Usuario < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validate :is_eighteen?

	#def is_eighteen?
	#   date = Time.parse ("#{ fecha_nacimiento_year + fecha_nacimiento_month + fecha_nacimiento_day } ")
	#   date > Time.now - 18.years ? true : false
	#end

  #def is_eighteen?
  #   fecha_nacimiento > Date.today - 18.years ? true : false
  #end

  belongs_to :logro

end
