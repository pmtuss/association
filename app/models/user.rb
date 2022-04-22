class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :enrollments, dependent: :destroy
  has_many :events, through: :enrollments

  has_one :card, dependent: :destroy
  has_one :bank_info, through: :card

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def self.search(name)
    if name
      where('name LIKE ?', "%#{name}%")
    else
      all
    end
  end
end
