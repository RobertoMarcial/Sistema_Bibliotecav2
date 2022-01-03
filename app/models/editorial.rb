class Editorial < ApplicationRecord

    has_many :books

    validates :nombre, uniqueness: { message: "de la empresa ya existe debe ser unico, favor de cambiar nombre de la empresa" }
    validates :telefono, uniqueness: { message: "que usted intenta registrar ya existe favor de cambiar" } 
    validates :nombre ,:pais, :telefono, presence:{message: "no debe estar en blanco"}
    validates :telefono, format:{with: /\A\d+\z/, message: "Debe contener unicamente digitos." }
    validate :code_validate
    #validates_with EditorialValidator



private
    def code_validate

        if self.telefono.nil? || self.telefono.length != 10 
            self.errors.add(:telefono, 'que usted intenta registrar debe poseer 10 digitos')
        end    


    end

end
