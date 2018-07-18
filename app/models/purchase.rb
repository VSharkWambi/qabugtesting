class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :showtime
end
