class Card < ApplicationRecord
  has_one :bank_info, touch: true
  belongs_to :user

  def mask_credit_card_number()
    trimmed_number = number.delete(' ')
    trimmed_number[-3..-1].rjust(trimmed_number.length, 'X')
  end
end
