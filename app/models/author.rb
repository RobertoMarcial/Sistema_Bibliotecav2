class Author < ApplicationRecord
    belongs_to :country, optional: true
    validates :nombre , :idioma,:ganancias_anuales ,presence:{message: "No debe estar en blanco"}
    validates :nombre, uniqueness: {message: "Ya se encuentra registrado"}
end
