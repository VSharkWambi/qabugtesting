class Purchase < ApplicationRecord
  validates :num_tickets, format: { with: /[1-9]+/ }
  belongs_to :user
  belongs_to :showtime
end
