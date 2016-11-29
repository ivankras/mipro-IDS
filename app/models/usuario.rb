class Usuario < ActiveRecord::Base
  
  belongs_to :logro
  has_many :favors, dependent: :destroy
  has_many :ofrecimiento, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :valid_date, :is_eighteen
  #validates_confirmation_of :password
  
  def is_eighteen
   if fecha_nacimiento
      errors.add(:fecha_nacimiento, "menor de edad, permiso denegado") if fecha_nacimiento > 18.years.ago && fecha_nacimiento <= Date.today 
    end
  end

  def valid_date
    if fecha_nacimiento
      errors.add(:fecha_nacimiento, "inválida") if fecha_nacimiento > Date.today 
    end
  end

  
  

end
