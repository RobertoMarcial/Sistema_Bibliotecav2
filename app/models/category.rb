class Category < ApplicationRecord
  
    validates :nombre, :descripcion, presence: {message: "No debe estar vacio"}
    
end
