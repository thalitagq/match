class Advogado < ApplicationRecord
    has_many :clientes

    def self.atualizar_menos(advogado_id)
        advogado = Advogado.where(id: advogado_id)
        qnt =  Advogado.find_by_sql("SELECT * FROM advogados WHERE advogados.id = #{advogado_id}").pluck(:qnt_clientes)
        qnt_int = qnt[0]
        novo_qnt = qnt_int-1
        advogado.update(qnt_clientes: novo_qnt)
    end

    def self.atualizar_mais(advogado_id)
        advogado = Advogado.where(id: advogado_id)
        qnt =  Advogado.find_by_sql("SELECT * FROM advogados WHERE advogados.id = #{advogado_id}").pluck(:qnt_clientes)
        qnt_int = qnt[0]
        if qnt_int == nil
            novo_qnt = 1
            advogado.update(qnt_clientes: novo_qnt) 
        else
            novo_qnt = qnt_int+1
            advogado.update(qnt_clientes: novo_qnt)      
        end
    end
end
