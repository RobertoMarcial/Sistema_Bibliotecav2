class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :nombre
      t.string :idioma
      t.integer :gat
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
