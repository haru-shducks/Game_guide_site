class Genre < ApplicationRecord
  self.inheritance_column = :genre_type
  has_many :post_genres, dependent: :destroy
end
