class Event < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments

  has_many :comments, as: :commentable
end
