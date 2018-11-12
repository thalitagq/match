class Cliente < ApplicationRecord
    belongs_to :advogado

    def self.buscar(estado_cliente)
        
        qnt = Advogado.where(estado: estado_cliente).minimum("qnt_clientes")
        if qnt == nil
            advogado =  Advogado.find_by_sql("SELECT * FROM advogados WHERE (advogados.estado = '#{estado_cliente}') LIMIT 1").pluck(:id)
            advogado_id = advogado[0]
            puts advogado_id
            return advogado_id
        else
            advogado = Advogado.find_by_sql("SELECT * FROM advogados WHERE (advogados.estado = '#{estado_cliente}' AND advogados.qnt_clientes = (SELECT MIN(qnt_clientes) FROM advogados WHERE advogados.estado = '#{estado_cliente}'))").pluck(:id)
            advogado_id = advogado[0]
            puts "IDDD:"
            puts advogado_id
            return advogado_id
        end
    end

    
    
end
