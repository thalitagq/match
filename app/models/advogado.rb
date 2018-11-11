class Advogado < ApplicationRecord
    has_many :clientes

    def buscar
        Advogado.find_by_sql()
    end 
end
