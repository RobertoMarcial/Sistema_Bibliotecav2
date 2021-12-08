class Editorial < ApplicationRecord
    validates :nombre, uniqueness: {message: "La editorial tiene que ser unica"}
    validates :nombre ,:pais, :telefono, presence: true
    
end
