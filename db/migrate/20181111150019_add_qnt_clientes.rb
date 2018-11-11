class AddQntClientes < ActiveRecord::Migration[5.1]
  def change
    add_column :advogados, :qnt_clientes, :integer
  end
end
