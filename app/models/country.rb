class Country < ApplicationRecord

 has_many :authors    
 
   #Valida que cuando se cree  o actualice la relacion , también se realicen las validaciones del modelo
  #validates_associated :countries
  validates :country, presence:{message: "No debe estar vacio"}

end
