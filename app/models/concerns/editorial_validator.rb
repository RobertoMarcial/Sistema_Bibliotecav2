class EditorialValidator < ActiveModel::Validator
#para verificar que no halla un stock negativo de productos
    def validate(record)
        self.validate_stock(record)
    end

    def validate_stock(record)
        if record.telefono?
            record.errors.add(:telefono, 'Ingrese digitos numericos')
        end
    end
end