class Usuario < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
=======
         #:confirmable

>>>>>>> eac5659c17c1df3ff3ec6a73793887348229d49f
	belongs_to :logro
end
