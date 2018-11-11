class CreateAdvogados < ActiveRecord::Migration[5.1]
  def change
    create_table :advogados do |t|
      t.string :nome
      t.string :estado

      t.timestamps
    end
  end
end
