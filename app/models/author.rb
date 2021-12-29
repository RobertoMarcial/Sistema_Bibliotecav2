class Author < ApplicationRecord
  belongs_to :country

  validates :nombre, :idioma, :gat, presence: {message: "No debe estar vacio"}
end
