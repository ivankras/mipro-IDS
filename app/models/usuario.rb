class Usuario < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def is_eighteen?
     fecha_nacimiento > Date.today - 18.years ? true : false
  end


  belongs_to :logro

end
