class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :body, presence: true
end
