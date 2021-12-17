class RemovePaisIdFromAuthors < ActiveRecord::Migration[5.2]
  def change
    remove_reference :authors, :pais_id, foreign_key: true
  end
end
