class User < ApplicationRecord
  has_one :address
  
  has_many :posts, dependent: :nullify
  has_many :comments, as: :commentable

  has_many :enrollments
  has_many :events, through: :enrollments

  has_one :card
  has_one :bank_info, through: :card

end
