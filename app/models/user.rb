class User < ApplicationRecord
  CSV_ATTRIBUTES = %w(email created_at).freeze
  has_one :profile, dependent: :destroy
  
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :enrollments, dependent: :destroy
  has_many :events, through: :enrollments

  has_one :card, dependent: :destroy
  has_one :bank_info, through: :card

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 8 }

  accepts_nested_attributes_for :profile

  def self.search(email)
    if email
      where('email LIKE ?', "%#{email}%")
    else
      all
    end
  end

  def authenticate(password)
    self.password = password
  end

end
