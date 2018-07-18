class Showtime < ApplicationRecord
  validates :tickets_sold, format: { with: /[1-9]+/, message: "Tickets has to be a number greater than 0"}
  belongs_to :movie
  belongs_to :theater
end
