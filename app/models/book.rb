class Book < ApplicationRecord
  belongs_to :editorial
  belongs_to :category
  belongs_to :author
end
