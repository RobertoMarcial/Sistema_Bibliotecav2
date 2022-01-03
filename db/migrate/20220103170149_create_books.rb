class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :imagen
      t.string :titulo
      t.string :edicion
      t.references :editorial, foreign_key: true
      t.references :category, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
