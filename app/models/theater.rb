class Theater < ApplicationRecord
  validates_presence_of :name, :zip, :description
  has_many :showtimes
  has_many :movies, through: :showtimes
end
