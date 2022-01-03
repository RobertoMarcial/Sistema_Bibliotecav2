class Category < ApplicationRecord
    has_many :books
  
    validates :nombre, :descripcion, presence: {message: "No debe estar vacio"}
    
end
