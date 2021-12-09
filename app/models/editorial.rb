class Editorial < ApplicationRecord

    validates :nombre, uniqueness: { message: "Ya existe debe ser unico, favor de cambiar nombre de la empresa" }
    validates :nombre ,:pais, :telefono, presence:{message: "No debe estar en blanco"}
    validates :telefono, format:{with: /\A\d+\z/, message: "Debe contener unicamente digitos." }
    validate :code_validate
    #validates_with EditorialValidator



private
    def code_validate

        if self.telefono.nil? || self.telefono.length != 10 
            self.errors.add(:telefono, 'Debe poseer 10 numeros')
        end    


    end

end
