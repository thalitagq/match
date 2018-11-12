class Cliente < ApplicationRecord
    belongs_to :advogado

    def buscar(estado_cliente)
        advogado = Advogado.find_by_sql("SELECT MIN(qnt_clientes) FROM advogados WHERE advogados.estado = estado_cliente")
        return advogado.id
    end

    
end
