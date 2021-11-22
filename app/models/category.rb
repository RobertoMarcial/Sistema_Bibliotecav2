class Category < ApplicationRecord
  
    validates :nombre, :descripcion, presence: {message: ""}
    
end
