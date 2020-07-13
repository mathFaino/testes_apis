class CreateFeirantes < ActiveRecord::Migration[6.0]
  def change
    create_table :feirantes do |t|
      t.string :nome
      t.string :apelido
      t.string :cpf
      t.date :dataNascimento

      t.timestamps
    end
  end
end
