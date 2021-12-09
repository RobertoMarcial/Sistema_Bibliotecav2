class Editorial < ApplicationRecord

    validates :nombre, uniqueness: { message: "ya existe la empresa debe ser unico, favor de cambiar nombre de la empresa" }
    validates :telefono, uniqueness: { message: "El numero que usted intenta registrar ya existe favor de cambiar" } 
    validates :nombre ,:pais, :telefono, presence:{message: "No debe estar en blanco"}
    validates :telefono, format:{with: /\A\d+\z/, message: "Debe contener unicamente digitos." }
    validate :code_validate
    #validates_with EditorialValidator



private
    def code_validate

        if self.telefono.nil? || self.telefono.length != 10 
            self.errors.add(:telefono, 'Debe poseer 10 digitos')
        end    


    end

end
