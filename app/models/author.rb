class Author < ApplicationRecord
  has_many :books
  belongs_to :country


  validates :nombre, :idioma, :gat, presence: {message: "Dato necesario"}
  
  validates :gat, numericality: {message: " Debe ser numerico"}

end
