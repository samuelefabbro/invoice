class Doc < ApplicationRecord
  belongs_to :client

  validates :number, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :date, presence: true

  def price_in_euro
    price.to_f / 100
  end

end
