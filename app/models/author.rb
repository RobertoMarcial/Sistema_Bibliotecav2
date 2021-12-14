class Author < ApplicationRecord
    validates :nombre ,:nacionalidad, :idioma,:ganancias_anuales ,presence:{message: "No debe estar en blanco"}
    validates :nombre, uniqueness: {message: "Ya se encuentra registrado"}

  


    
    
end
