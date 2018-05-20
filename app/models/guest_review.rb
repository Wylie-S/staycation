class GuestReview < ApplicationRecord
belongs_to :guest , class_name: "User"
end
