class Movie < ApplicationRecord
  validates_presence_of :name, :rating, :running_time
  has_many :showtimes
  has_many :theaters, :through => :showtimes
end
