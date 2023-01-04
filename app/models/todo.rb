class Todo < ApplicationRecord
  validates :title, presence: {  message: "Title should not be empty" }, length: { minimum: 5, maximum: 50, message:"Title length should be between 5 to 50"}
  validates :description, presence: {message: "Description should not be empty"}, length: {minimum: 5 , maximum: 50, message: "Description length should be between 5 to 50"}
end
